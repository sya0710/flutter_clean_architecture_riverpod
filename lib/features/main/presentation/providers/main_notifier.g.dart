// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MainNotifier)
final mainProvider = MainNotifierProvider._();

final class MainNotifierProvider
    extends $NotifierProvider<MainNotifier, MainState> {
  MainNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainNotifierHash();

  @$internal
  @override
  MainNotifier create() => MainNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MainState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MainState>(value),
    );
  }
}

String _$mainNotifierHash() => r'd3897757c6b4e5b9055d514f63e7603c14c9e38f';

abstract class _$MainNotifier extends $Notifier<MainState> {
  MainState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MainState, MainState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MainState, MainState>,
              MainState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
