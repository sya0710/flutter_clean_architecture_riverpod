import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodlive/app/presentation/providers/app_state.dart';

part 'app_notifier.g.dart';

@riverpod
class AppNotifier extends _$AppNotifier {
  @override
  AppState build() {
    return const AppState();
  }

  void setAppTitle(String? value) {
    state = state.copyWith(appTitle: value);
  }

  void setUnauthorized(bool? value) {
    state = state.copyWith(isUnauthorized: value);
  }

  void setNoNetwork(bool? value) {
    state = state.copyWith(isNoNetwork: value);
  }

  void setTimeout(bool? value) {
    state = state.copyWith(isTimeOut: value);
  }

  void reset() {
    state = const AppState();
  }
}
