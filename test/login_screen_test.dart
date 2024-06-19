import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clothing_store/screens/login_screen.dart'; 

void main() {
  testWidgets('LoginScreen UI test', (WidgetTester tester) async {
    // Build the LoginScreen widget.
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen(),
    ));

    // Verify the logo is displayed.
    expect(find.byType(ClipOval), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);

    // Verify the presence of Email and Password TextFields.
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);

    // Verify the presence of buttons.
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
