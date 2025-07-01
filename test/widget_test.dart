// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:helloworld/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the 'Reset' button and trigger a frame.
    await tester.tap(find.text('Reset'));
    await tester.pump();

    // Verify that our counter has reset to 0.
    expect(find.text('0 ... and counting'), findsOneWidget);
    expect(find.text('-1 ... and counting'), findsNothing);

    // Tap the 'Decrement' button and trigger a frame.
    await tester.tap(find.text('Decrement'));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0 ... and counting'), findsNothing);
    expect(find.text('-1 ... and counting'), findsOneWidget);

    await tester.tap(find.text('Increment'));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('-1 ... and counting'), findsNothing);
    expect(find.text('0 ... and counting'), findsOneWidget);

    // Tap the 'Reset' button and trigger a frame.
    await tester.tap(find.text('Reset'));
    await tester.pump();

    // Verify that our counter has reset to 0.
    expect(find.text('0 ... and counting'), findsOneWidget);
    expect(find.text('-1 ... and counting'), findsNothing);
  });
}
