import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlive/core/extensions/context_extension.dart';

class BasePage extends HookConsumerWidget {
  const BasePage({super.key});

  Future<void> showSnackBar(
    BuildContext context,
    String? message, {
    bool isError = false,
  }) async {
    if (message == null || message.isEmpty) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isError ? Colors.red : Colors.green,
        content: Text(
          message,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox.shrink();
  }
}
