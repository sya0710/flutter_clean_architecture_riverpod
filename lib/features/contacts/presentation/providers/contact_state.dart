import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpodlive/features/contacts/domain/entities/contact_entity.dart';

part 'contact_state.freezed.dart';

@freezed
abstract class ContactState with _$ContactState {
  const factory ContactState({
    @Default([]) List<ContactEntity> contacts,
    String? apiResultMessage,
    @Default(false) bool? updateDatabaseFinish,
  }) = _ContactState;
}
