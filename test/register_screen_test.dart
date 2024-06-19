import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clothing_store/screens/register_screen.dart'; // Adjust the import to match your project structure

void main() {
  testWidgets('RegistrationScreen UI test', (WidgetTester tester) async {
    // Build the RegistrationScreen widget.
    await tester.pumpWidget(MaterialApp(
      home: RegistrationScreen(),
    ));

    // Verify the app bar title is displayed.
    expect(find.descendant(
      of: find.byType(AppBar),
      matching: find.text('Register'),
    ), findsOneWidget);

    // Verify the logo is displayed.
    expect(find.byType(ClipOval), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    // Verify the presence of Name, Email, Password, and Confirm Password TextFields.
    expect(find.byType(TextField), findsNWidgets(4));
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Confirm Password'), findsOneWidget);

    // Verify the presence of the Register button.
    expect(find.widgetWithText(ElevatedButton, 'Register'), findsOneWidget);
  });
}
