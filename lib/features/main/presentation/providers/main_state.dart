import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

enum MainTab { contact, group }

@freezed
abstract class MainState with _$MainState {
  const factory MainState({@Default(MainTab.contact) MainTab tab}) = _MainState;
}
