import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodlive/features/main/presentation/providers/main_state.dart';

part 'main_notifier.g.dart';

@riverpod
class MainNotifier extends _$MainNotifier {
  @override
  MainState build() {
    return const MainState();
  }

  void setTab(MainTab tab) {
    state = state.copyWith(tab: tab);
  }

  void reset() {
    state = const MainState();
  }
}
