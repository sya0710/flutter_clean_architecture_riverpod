import 'dart:io';

import 'package:detect_proxy_setting/detect_proxy_setting.dart';

class HttpOverridesImpl extends HttpOverrides {
  String address = '';
  String type = 'DIRECT';
  String proxyBypass = '';
  String configUrl = '';

  @override
  String findProxyFromEnvironment(Uri url, Map<String, String>? environment) {
    if (type == 'DIRECT') {
      return 'DIRECT';
    }

    return 'PROXY $address';
  }

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final effectiveContext = context ?? SecurityContext.defaultContext;
    return super.createHttpClient(effectiveContext)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        return true;
      }
      ..authenticateProxy =
          (String host, int port, String scheme, String? realm) async {
            return true;
          };
  }

  Future<dynamic> init() async {
    final setting = await proxySetting();
    if (setting == null || setting.mode == ProxySettingModeEnum.direct) {
      type = 'DIRECT';
    } else if (setting.mode == ProxySettingModeEnum.proxy &&
        setting.proxy.isNotEmpty) {
      type = 'PROXY';
      address = setting.proxy;
      proxyBypass = setting.proxyBypass;
      configUrl = setting.configUrl;
    }

    type = 'PROXY';
    address = '192.168.200.45:12080';
  }
}
