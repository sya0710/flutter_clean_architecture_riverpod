import 'package:riverpodlive/core/di/bootstrap.dart';

class ApiEndpoint {
  ApiEndpoint._();

  static Flavor env = Flavor.dev;
  static String getBaseURL() {
    switch (env) {
      case Flavor.dev:
        return '';
      case Flavor.stg:
        return '';
      case Flavor.production:
        return '';
    }
  }

  static const apiLogin = '/v1/auth/login';
  static const apiGetListContact = '/contacts';
}
