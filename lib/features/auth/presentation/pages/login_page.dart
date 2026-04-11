import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlive/core/config/lang/l10n/l10n.dart';
import 'package:riverpodlive/core/config/router/router_path.dart';
import 'package:riverpodlive/core/constants/app_colors_constants.dart';
import 'package:riverpodlive/core/extensions/context_extension.dart';
import 'package:riverpodlive/core/presentation/pages/base_page.dart';
import 'package:riverpodlive/features/auth/data/requests/login_request.dart';
import 'package:riverpodlive/features/auth/enums/auth_enum.dart';
import 'package:riverpodlive/features/auth/presentation/providers/auth_notifier.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const LoginPageView();
  }
}

class LoginPageView extends BasePage {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen(authProvider, (_, next) {
      // Only react to state changes triggered by the login action
      if (next.value?.action != AuthAction.login) return;
      next.whenOrNull(
        data: (_) => context.go(Routers.home.path),
        error: (error, _) => showSnackBar(context, error.toString()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.phone,
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColorsConstants.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextFormField(
              controller: phoneController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 10.h),
            Text(
              context.l10n.password,
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColorsConstants.textColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextFormField(
              controller: passwordController,
              obscuringCharacter: '●',
              obscureText: true,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  if (phoneController.text.isEmpty ||
                      passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(context.l10n.pleaseFillAllFields),
                      ),
                    );
                    return;
                  }

                  ref
                      .read(authProvider.notifier)
                      .login(
                        LoginRequest(
                          phone: phoneController.text,
                          password: passwordController.text,
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColorsConstants.primary,
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.white,
                  disabledBackgroundColor: AppColorsConstants.primary.withAlpha(
                    102,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 16.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                    side: const BorderSide(color: Colors.transparent),
                  ),
                ),
                child: Text(
                  context.l10n.login,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
