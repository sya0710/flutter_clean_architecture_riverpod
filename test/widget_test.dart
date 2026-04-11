import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpodlive/features/main/presentation/pages/main_page.dart';

void main() {
  testWidgets('Main screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MainPage()));

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
