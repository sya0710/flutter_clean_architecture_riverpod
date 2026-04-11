import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlive/app/presentation/providers/app_notifier.dart';
import 'package:riverpodlive/core/config/lang/l10n/l10n.dart';
import 'package:riverpodlive/core/constants/app_colors_constants.dart';
import 'package:riverpodlive/core/presentation/widgets/bottom_navigation_bar_widget.dart';
import 'package:riverpodlive/features/contacts/presentation/pages/contact_page.dart';
import 'package:riverpodlive/features/main/presentation/providers/main_notifier.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const MainPageView();
  }
}

class MainPageView extends HookConsumerWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTitle = ref.watch(
      appProvider.select((state) => state.appTitle ?? context.l10n.contact),
    );
    final currentTab = ref.watch(
      mainProvider.select((state) => state.tab),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          shadowColor: AppColorsConstants.grey,
          backgroundColor: AppColorsConstants.white,
          centerTitle: true,
          title: Text(
            appTitle,
            style: TextStyle(
              color: AppColorsConstants.textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: <Widget>[
          const ContactPage(),
          const Text('Page 2'),
        ][currentTab.index],
        bottomNavigationBar: const BottomNavigationBarWidget(),
      ),
    );
  }
}
