import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Emits `true` when the device has at least one active network interface,
/// `false` when fully offline.
///
/// Uses [Connectivity.onConnectivityChanged] — zero polling, battery-friendly.
final networkStatusProvider = StreamProvider<bool>((ref) async* {
  final connectivity = Connectivity();

  // Emit the current reachability state immediately.
  final initial = await connectivity.checkConnectivity();
  yield !initial.contains(ConnectivityResult.none);

  // Then react to every OS-reported change event.
  yield* connectivity.onConnectivityChanged.map(
    (results) => !results.contains(ConnectivityResult.none),
  );
});
