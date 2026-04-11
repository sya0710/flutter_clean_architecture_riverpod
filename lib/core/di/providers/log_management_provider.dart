import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpodlive/core/constants/settings_constants.dart';

class LogManagement {
  LogManagement({
    this.fileName = '${SettingConstants.logFileName}.txt',
    this.rotateDaily = true,
    this.maxFileSizeInBytes = SettingConstants.maxFileSizeLogInBytes,
  });

  final String fileName;
  final bool rotateDaily;
  final int maxFileSizeInBytes;

  Isolate? _workerIsolate;
  ReceivePort? _receivePort;
  StreamSubscription<dynamic>? _receiveSubscription;
  SendPort? _workerSendPort;
  final Map<int, Completer<void>> _pendingCommands = {};
  Completer<void>? _readyCompleter;
  int _commandId = 0;
  Future<void>? _initFuture;
  bool _isInitialized = false;

  Future<Directory> _getLogDirectory() async {
    final dir = await getApplicationDocumentsDirectory();

    final logsDir = Directory('${dir.path}/${SettingConstants.logDirName}');
    if (!logsDir.existsSync()) {
      logsDir.createSync(recursive: true);
    }
    return logsDir;
  }

  Future<void> init() async {
    if (_isInitialized) return;
    _initFuture ??= _startWorker();
    await _initFuture;
    _isInitialized = true;
  }

  Future<void> log(String message) async {
    await init();
    await _sendCommand(type: 'write', message: message);
  }

  Future<void> _startWorker() async {
    final logDir = await _getLogDirectory();

    _receivePort = ReceivePort();
    _readyCompleter = Completer<void>();

    _receiveSubscription = _receivePort!.listen(_handleWorkerMessage);

    _workerIsolate = await Isolate.spawn(
      _logWorkerMain,
      {
        'mainSendPort': _receivePort!.sendPort,
        'fileName': fileName,
        'logDirPath': logDir.path,
        'rotateDaily': rotateDaily,
        'maxFileSizeInBytes': maxFileSizeInBytes,
      },
      debugName: 'log_io_worker',
    );

    await _readyCompleter!.future;
    await _sendCommand(type: 'init');
  }

  void _handleWorkerMessage(dynamic message) {
    if (message is! Map<Object?, Object?>) {
      return;
    }

    final type = message['type'];
    if (type == 'ready') {
      _workerSendPort = message['sendPort'] as SendPort?;
      _readyCompleter?.complete();
      return;
    }

    final id = message['id'];
    if (id is! int) {
      return;
    }

    final completer = _pendingCommands.remove(id);
    if (completer == null) {
      return;
    }

    final ok = message['ok'] == true;
    if (ok) {
      completer.complete();
    } else {
      completer.completeError(
        Exception((message['error'] ?? 'Unknown log worker error').toString()),
      );
    }
  }

  Future<void> _sendCommand({required String type, String? message}) {
    final sendPort = _workerSendPort;
    if (sendPort == null) {
      return Future.error(
        StateError('Log worker is not ready. Call init() before log().'),
      );
    }

    final id = ++_commandId;
    final completer = Completer<void>();
    _pendingCommands[id] = completer;
    sendPort.send({
      'id': id,
      'type': type,
      'message': message,
    });
    return completer.future;
  }

  Future<void> dispose() async {
    if (_workerSendPort != null) {
      try {
        await _sendCommand(type: 'dispose');
      } on Exception {
        // Worker may already be down; ignore during shutdown.
      }
    }

    for (final completer in _pendingCommands.values) {
      if (!completer.isCompleted) {
        completer.completeError(StateError('Log worker disposed'));
      }
    }
    _pendingCommands.clear();

    await _receiveSubscription?.cancel();
    _receivePort?.close();

    _workerIsolate?.kill(priority: Isolate.immediate);
    _workerIsolate = null;
    _workerSendPort = null;
    _receivePort = null;
    _receiveSubscription = null;
    _readyCompleter = null;
    _initFuture = null;
    _isInitialized = false;
  }

  Future<void> requestStoragePermission() async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      final result = await Permission.storage.request();
      if (!result.isGranted) {
        await log('Storage permission denied');
      }
    }
  }
}

final logManagementProvider = Provider<LogManagement>((ref) {
  final log = LogManagement();
  ref.onDispose(log.dispose);
  return log;
});

void _logWorkerMain(Map<Object?, Object?> initialMessage) {
  final mainSendPort = (initialMessage['mainSendPort'] ?? '') as SendPort;
  final fileName = (initialMessage['fileName'] ?? '') as String;
  final logDirPath = (initialMessage['logDirPath'] ?? '') as String;
  final rotateDaily = (initialMessage['rotateDaily'] ?? '') as bool;
  final maxFileSizeInBytes = (initialMessage['maxFileSizeInBytes'] ?? 0) as int;

  final worker = _LogWorkerState(
    fileName: fileName,
    logDirPath: logDirPath,
    rotateDaily: rotateDaily,
    maxFileSizeInBytes: maxFileSizeInBytes,
  );

  final commandPort = ReceivePort();
  mainSendPort.send({'type': 'ready', 'sendPort': commandPort.sendPort});

  commandPort.listen((dynamic rawMessage) async {
    if (rawMessage is! Map<Object?, Object?>) {
      return;
    }

    final id = rawMessage['id'];
    if (id is! int) {
      return;
    }

    final type = rawMessage['type']?.toString() ?? '';
    final message = rawMessage['message']?.toString() ?? '';

    try {
      switch (type) {
        case 'init':
          await worker.init();
        case 'write':
          await worker.write(message);
        case 'dispose':
          await worker.dispose();
        default:
          throw UnsupportedError('Unknown log worker command: $type');
      }

      mainSendPort.send({'id': id, 'ok': true});

      if (type == 'dispose') {
        commandPort.close();
        Isolate.exit();
      }
    } on Exception catch (error) {
      mainSendPort.send({'id': id, 'ok': false, 'error': error.toString()});
    }
  });
}

class _LogWorkerState {
  _LogWorkerState({
    required this.fileName,
    required this.logDirPath,
    required this.rotateDaily,
    required this.maxFileSizeInBytes,
  });

  final String fileName;
  final String logDirPath;
  final bool rotateDaily;
  final int maxFileSizeInBytes;

  File? _logFile;
  IOSink? _sink;
  bool _isInitialized = false;

  Directory _getLogDirectory() {
    final logsDir = Directory(logDirPath);
    if (!logsDir.existsSync()) {
      logsDir.createSync(recursive: true);
    }
    return logsDir;
  }

  String _dailyFileName() {
    final dateStr = DateTime.now().toIso8601String().substring(0, 10);
    return '${SettingConstants.logFileName}_$dateStr.txt';
  }

  String _activeFileName() => rotateDaily ? _dailyFileName() : fileName;

  Future<void> init() async {
    if (_isInitialized) {
      return;
    }

    _cleanOldLogFiles();
    await _openFile(_activeFileName());
    _isInitialized = true;
  }

  Future<void> write(String message) async {
    await init();

    final now = DateTime.now().toIso8601String();
    final line = '[$now] $message\n';

    if (rotateDaily) {
      await _maybeRotateDaily();
    }
    await _maybeRotateSize(line.length);

    _sink?.write(line);
  }

  Future<void> _openFile(String activeFileName) async {
    final dir = _getLogDirectory();
    final path = '${dir.path}/$activeFileName';

    _logFile = File(path);
    if (!_logFile!.existsSync()) {
      _logFile!.createSync(recursive: true);
    }
    _sink = _logFile!.openWrite(mode: FileMode.append);
  }

  Future<void> _maybeRotateDaily() async {
    final currentName = _logFile?.uri.pathSegments.last;
    final expectedName = _dailyFileName();
    if (currentName == expectedName) {
      return;
    }

    await _closeSink();
    await _openFile(expectedName);
  }

  Future<void> _maybeRotateSize(int upcomingBytes) async {
    final currentFile = _logFile;
    if (currentFile == null) {
      return;
    }

    final length = currentFile.lengthSync();
    if (length + upcomingBytes <= maxFileSizeInBytes) {
      return;
    }

    await _closeSink();

    final dir = _getLogDirectory();
    final baseName = _activeFileName();
    var index = 1;
    late File newFile;
    while (true) {
      final indexedName = baseName.endsWith('.txt')
          ? '${baseName.substring(0, baseName.length - 4)}_$index.txt'
          : '${baseName}_$index.txt';
      newFile = File('${dir.path}/$indexedName');
      if (!newFile.existsSync()) {
        break;
      }
      index++;
    }

    _logFile = newFile;
    _logFile!.createSync(recursive: true);
    _sink = _logFile!.openWrite(mode: FileMode.append);
  }

  Future<void> _closeSink() async {
    await _sink?.flush();
    await _sink?.close();
    _sink = null;
  }

  Future<void> dispose() async {
    await _closeSink();
    _isInitialized = false;
  }

  void _cleanOldLogFiles() {
    final dir = _getLogDirectory();
    final files =
        dir
            .listSync()
            .whereType<File>()
            .where((f) => f.path.endsWith('.txt'))
            .toList()
          ..sort(
            (a, b) => a.statSync().modified.compareTo(b.statSync().modified),
          );

    const maxFiles = 30;
    if (files.length <= maxFiles) {
      return;
    }

    final toDelete = files.sublist(0, files.length - maxFiles);
    for (final f in toDelete) {
      try {
        f.deleteSync();
      } on Exception {
        // Ignore cleanup failures in background worker.
      }
    }
  }
}
