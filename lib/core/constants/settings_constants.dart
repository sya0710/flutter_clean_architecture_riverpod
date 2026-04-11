class SettingConstants {
  static const int timeOutConnection = 30; // seconds
  static const int minCharacterSuggest = 3; // characters
  static const String logFileName = 'app_log';
  static const String logDirName = 'logs';
  static const int maxFileSizeLogInBytes = 5 * 1024 * 1024; // MB

  // Proxy config (use with --dart-define in development)
  static const bool enableApiProxy = bool.fromEnvironment(
    'ENABLE_API_PROXY',
    defaultValue: true,
  );
}
