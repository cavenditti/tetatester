// This is a basic Flutter widget test for the Cow Counter app.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:cow_counter_app/main.dart';

void main() {
  testWidgets('Cow Counter app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CowCounterApp());

    // Verify that the app loads correctly
    expect(find.text('🐄 Cow Counter'), findsOneWidget);
    expect(find.text('Welcome to Cow Counter!'), findsOneWidget);
    expect(find.text('Take or select a photo to automatically count the cows in your image'), findsOneWidget);

    // Verify that buttons are present
    expect(find.text('Camera'), findsOneWidget);
    expect(find.text('Gallery'), findsOneWidget);
    expect(find.text('Count Cows'), findsOneWidget);
  });
}
