import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlive/app/presentation/providers/app_notifier.dart';
import 'package:riverpodlive/core/config/lang/l10n/l10n.dart';
import 'package:riverpodlive/core/constants/app_colors_constants.dart';
import 'package:riverpodlive/core/constants/app_images_constants.dart';
import 'package:riverpodlive/features/main/presentation/providers/main_notifier.dart';
import 'package:riverpodlive/features/main/presentation/providers/main_state.dart';

class BottomNavigationBarWidget extends HookConsumerWidget {
  const BottomNavigationBarWidget({super.key, this.onDestinationSelected});

  final VoidCallback? onDestinationSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTab = ref.watch(mainProvider.select((state) => state.tab));

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: AppColorsConstants.grey, blurRadius: 0.1)],
      ),
      child: NavigationBar(
        height: 62.w,
        labelPadding: EdgeInsets.only(bottom: 8.w),
        onDestinationSelected: (int index) {
          if (currentTab.index == index) {
            return;
          }

          ref.read(mainProvider.notifier).setTab(MainTab.values[index]);
          switch (index) {
            case 0:
              ref.read(appProvider.notifier).setAppTitle(context.l10n.contact);
            case 1:
              ref.read(appProvider.notifier).setAppTitle(context.l10n.group);
          }

          if (onDestinationSelected != null) {
            onDestinationSelected?.call();
          }
        },
        indicatorColor: Colors.transparent,
        selectedIndex: currentTab.index,
        destinations: <Widget>[
          ColoredBox(
            color: currentTab.index == 0
                ? AppColorsConstants.tabBarBackground
                : AppColorsConstants.white,
            child: NavigationDestination(
              selectedIcon: SvgPicture.asset(
                AppImagesConstants.tabContactSelected,
                width: 24.w,
                height: 24.w,
                colorFilter: const ColorFilter.mode(
                  AppColorsConstants.primary,
                  BlendMode.srcIn,
                ),
              ),
              icon: SvgPicture.asset(
                AppImagesConstants.tabContact,
                width: 24.w,
                height: 24.w,
              ),
              label: context.l10n.contact,
            ),
          ),
          ColoredBox(
            color: currentTab.index == 1
                ? AppColorsConstants.tabBarBackground
                : AppColorsConstants.white,
            child: NavigationDestination(
              selectedIcon: SvgPicture.asset(
                AppImagesConstants.tabGroupSelected,
                width: 24.w,
                height: 24.w,
                colorFilter: const ColorFilter.mode(
                  AppColorsConstants.primary,
                  BlendMode.srcIn,
                ),
              ),
              icon: SvgPicture.asset(
                AppImagesConstants.tabGroup,
                width: 24.w,
                height: 24.w,
              ),
              label: context.l10n.group,
              tooltip: '',
            ),
          ),
        ],
      ),
    );
  }
}
