// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helloworld/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('Counter Page'));
    await tester.pumpAndSettle();

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

  testWidgets('BMI test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.text('BMI Page'));
    await tester.pumpAndSettle();

    // Enter height and weight values.
    await tester.enterText(find.byKey(const Key('heightField')), '1.80');
    await tester.enterText(find.byKey(const Key('weightField')), '75');
    await tester.pump();
    await tester.tap(find.text('Calculate BMI'));
    await tester.pump();

    // Verify that the BMI is calculated correctly.
    expect(find.text('BMI: 23.15'), findsOneWidget);
    expect(find.text('BMI: 0.0'), findsNothing);

    // Verify that the BMI is saved in shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final savedBMI = prefs.getDouble('BMI') ?? 0.0;
    expect(savedBMI, closeTo(23.15, 0.01)); 

    // Second test to ensure the BMI is loaded correctly.
    await tester.enterText(find.byKey(const Key('heightField')), '1.70');
    await tester.enterText(find.byKey(const Key('weightField')), '65'); 
    await tester.pump();
    await tester.tap(find.text('Calculate BMI'));
    await tester.pump();

    // Verify that the BMI is calculated correctly.
    expect(find.text('BMI: 22.49'), findsOneWidget);
    expect(find.text('BMI: 0.0'), findsNothing);

    // Verify that the new BMI is saved in shared preferences.
    final newSavedBMI = prefs.getDouble('BMI') ?? 0.0;
    expect(newSavedBMI, closeTo(22.49, 0.01));
    // Verify that the previous BMI is not displayed.
    expect(find.text('BMI: 23.15'), findsNothing);
    
  });
}
