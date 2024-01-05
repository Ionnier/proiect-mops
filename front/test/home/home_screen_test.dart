import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/ui/home_screen.dart';

void main() {
  testWidgets(
      'Ensure home screen has a book icon, a sign up button and a login button',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(),
    ));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.book), findsOne);
    expect(find.byWidgetPredicate((widget) {
      if (widget is ButtonStyleButton) {
        var child = widget.child;
        if (child != null) {
          if (child is Text) {
            if (child.data != null &&
                child.data!
                    .toLowerCase()
                    .replaceAll(" ", "")
                    .contains("login")) {
              return true;
            }
            if (child.data != null &&
                child.data!
                    .toLowerCase()
                    .replaceAll(" ", "")
                    .contains("signup")) {
              return true;
            }
          }
        }
      }
      return false;
    }), findsAtLeast(2));
  });
}
