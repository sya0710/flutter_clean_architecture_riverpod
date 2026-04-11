import 'package:riverpodlive/core/data/datasources/prefs/pref_value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefValueFactory {
  const PrefValueFactory(this._pref);

  final SharedPreferences _pref;

  PrefValue<bool> boolPref({required String key, bool defaultValue = false}) =>
      PrefValue(_pref, key, defaultValue);

  PrefValue<int> intPref({required String key, int defaultValue = 0}) =>
      PrefValue(_pref, key, defaultValue);

  PrefValue<double> doublePref({
    required String key,
    double defaultValue = 0.0,
  }) => PrefValue(_pref, key, defaultValue);

  PrefValue<String> stringPref({
    required String key,
    String defaultValue = '',
  }) => PrefValue(_pref, key, defaultValue);

  PrefValue<List<String>> listStringPref({
    required String key,
    List<String> defaultValue = const [],
  }) => PrefValue(_pref, key, defaultValue);
}
