// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ErrorNotifier)
final errorProvider = ErrorNotifierProvider._();

final class ErrorNotifierProvider
    extends $NotifierProvider<ErrorNotifier, PlatformCallException?> {
  ErrorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorNotifierHash();

  @$internal
  @override
  ErrorNotifier create() => ErrorNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlatformCallException? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlatformCallException?>(value),
    );
  }
}

String _$errorNotifierHash() => r'a14ea934c529f89226ec24009aa6c69d07f43a88';

abstract class _$ErrorNotifier extends $Notifier<PlatformCallException?> {
  PlatformCallException? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<PlatformCallException?, PlatformCallException?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlatformCallException?, PlatformCallException?>,
              PlatformCallException?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
