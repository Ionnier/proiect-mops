// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:admin/screens/home/home_screen.dart';
import 'package:admin/screens/rentalscreen/rental_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:admin/main.dart';

void main() {
  testWidgets('Home screen has rentals objects', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HomeScreen()),
    );
    await tester.pumpAndSettle();
    expect(find.text("Rentals"), findsOne);
    expect(find.text("Manage rentals"), findsOne);
  });
  testWidgets('Home screen navigates to RentalScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HomeScreen()),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text("Rentals"));
    await tester.pumpAndSettle();
    expect(find.byType(RentalScreen), findsOne);
  });

  testWidgets('Rental Screen has 4 input fields', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: HomeScreen()),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text("Rentals"));
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsAtLeast(4));
    expect(find.byType(AppBar), findsAtLeast(1));
    expect(find.byType(TextButton), findsAtLeast(1));
    expect(find.text("Submit"), findsAtLeast(1));
  });
}
