import 'package:shared_preferences/shared_preferences.dart';

class PrefValue<T> {
  const PrefValue(this._pref, this.key, this.defaultValue);

  final SharedPreferences _pref;
  final String key;
  final T defaultValue;

  T get value {
    Object? run() {
      switch (T) {
        case const (bool):
          return _pref.getBool(key);
        case const (String):
          return _pref.getString(key);
        case const (int):
          return _pref.getInt(key);
        case const (double):
          return _pref.getDouble(key);
        case const (List<String>):
          return _pref.getStringList(key);
      }
      throw Exception('Unsupported type: ${T.runtimeType}');
    }

    return (run() ?? defaultValue) as T;
  }

  set value(T v) {
    if (v is bool) {
      _pref.setBool(key, v);
      return;
    }

    if (v is String) {
      _pref.setString(key, v);
      return;
    }

    if (v is int) {
      _pref.setInt(key, v);
      return;
    }

    if (v is double) {
      _pref.setDouble(key, v);
      return;
    }

    if (v is List<String>) {
      _pref.setStringList(key, v);
      return;
    }
    throw Exception('Unsupported type: ${v.runtimeType}');
  }
}
