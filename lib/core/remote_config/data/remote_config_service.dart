/// Abstract contract for a Remote Config data source.
///
/// Keeps the rest of the app decoupled from Firebase so
/// the underlying provider can be swapped or mocked in tests.
abstract interface class RemoteConfigService {
  /// Initialise the service, set defaults and perform the first fetch.
  Future<void> init();

  /// Force a fresh fetch from the remote source and activate the result.
  Future<void> refresh();

  /// Returns the boolean value for [key].
  bool getBool(String key);

  /// Returns the string value for [key].
  String getString(String key);

  /// Returns the integer value for [key].
  int getInt(String key);

  /// Returns the double value for [key].
  double getDouble(String key);
}
