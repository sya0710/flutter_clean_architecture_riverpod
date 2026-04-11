import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodlive/core/constants/pref_constants.dart';
import 'package:riverpodlive/core/data/datasources/prefs/pref_value.dart';
import 'package:riverpodlive/core/data/datasources/prefs/pref_value_factory.dart';
import 'package:riverpodlive/core/di/providers/database_local_management_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManagement {
  StorageManagement(this._database);

  final DatabaseLocalManagement _database;

  late final SharedPreferences _pref;

  late final PrefKeys _keys = Constants.prefKeys;

  late final PrefValueFactory _factory;

  late final PrefValue<String> accessToken;

  Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
    _factory = PrefValueFactory(_pref);
    accessToken = _factory.stringPref(key: _keys.accessToken);
  }

  void clearAccessToken() {
    accessToken.value = '';
  }

  Future<void> clearDataWhenLogout() async {
    clearAccessToken();
    await _database.reset();
  }
}

final storageManagementProvider = Provider<StorageManagement>((ref) {
  final database = ref.read(databaseLocalManagementProvider);
  return StorageManagement(database);
});
