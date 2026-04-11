// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ContactNotifier)
final contactProvider = ContactNotifierProvider._();

final class ContactNotifierProvider
    extends $AsyncNotifierProvider<ContactNotifier, ContactState> {
  ContactNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contactProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contactNotifierHash();

  @$internal
  @override
  ContactNotifier create() => ContactNotifier();
}

String _$contactNotifierHash() => r'425c01c3df6f1bb939b576035e6d5ab7e41ab5e7';

abstract class _$ContactNotifier extends $AsyncNotifier<ContactState> {
  FutureOr<ContactState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ContactState>, ContactState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ContactState>, ContactState>,
              AsyncValue<ContactState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
