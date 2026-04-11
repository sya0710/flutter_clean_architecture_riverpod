import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpodlive/core/config/lang/l10n/gen/app_localizations.dart';
import 'package:riverpodlive/core/config/router/router.dart';
import 'package:riverpodlive/core/constants/app_colors_constants.dart';
import 'package:riverpodlive/core/constants/device_constants.dart';
import 'package:riverpodlive/core/constants/locale_constants.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const AppView();
  }
}

class AppView extends ConsumerWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return ScreenUtilInit(
      designSize: const Size(
        DeviceConstants.designDeviceWidth,
        DeviceConstants.designDeviceHeight,
      ),
      builder: (context, child) {
        return MaterialApp.router(
          locale: LocaleConstants.vietnamese,
          routerConfig: router,
          theme: ThemeData(
            fontFamily: 'Arial',
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor: Colors.white,
              labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
                return TextStyle(
                  color: AppColorsConstants.textColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                );
              }),
            ),
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child) {
            return child!;
          },
        );
      },
    );
  }
}
