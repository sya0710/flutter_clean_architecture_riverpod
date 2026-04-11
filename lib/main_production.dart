import 'package:riverpodlive/app/presentation/pages/app.dart';
import 'package:riverpodlive/core/api_end_point.dart';
import 'package:riverpodlive/core/di/bootstrap.dart';

void main() async {
  ApiEndpoint.env = Flavor.production;
  await bootstrap(
    () => const App(),
    flavor: Flavor.production,
  );
}
