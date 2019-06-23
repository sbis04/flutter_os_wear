import 'package:flutter/material.dart';
import 'package:flutter_os/main.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Verify Platform version', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    // Verify that platform version is retrieved.
    expect(
        find.byWidgetPredicate(
          (Widget widget) => widget is Text && widget.data.startsWith('Shape:'),
        ),
        findsOneWidget);
  });
}
