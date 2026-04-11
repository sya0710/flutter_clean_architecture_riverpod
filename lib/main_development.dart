import 'package:requests_inspector/requests_inspector.dart';
import 'package:riverpodlive/app/presentation/pages/app.dart';
import 'package:riverpodlive/core/api_end_point.dart';
import 'package:riverpodlive/core/di/bootstrap.dart';

void main() async {
  ApiEndpoint.env = Flavor.dev;
  await bootstrap(
    () => const RequestsInspector(hideInspectorBanner: true, child: App()),
    flavor: Flavor.dev,
  );
}
