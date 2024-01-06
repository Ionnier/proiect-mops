import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:front/data/auth_repository.dart';
import 'package:front/data/settings.dart';
import 'package:front/ui/home_screen.dart';
import 'package:front/ui/signup/sign_up_screen.dart';
import 'package:front/ui/signup/signup_vm.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';

import 'home_screen_test.mocks.dart';

@GenerateMocks([Settings, AuthService, DefaultCacheManager])
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

  testWidgets('Test move to SignupScreen', (WidgetTester tester) async {
    var mockedAuthService = MockAuthService();
    var mockedSettings = MockSettings();
    await tester.pumpWidget(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (context) => SignUpViewModel(
                    authRepository:
                        AuthRepository(mockedAuthService, mockedSettings))),
            Provider<BaseCacheManager>(
                create: (context) => DefaultCacheManager()),
          ],
          child: const MaterialApp(
            home: HomeScreen(),
          )),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byWidgetPredicate((widget) {
      if (widget is OutlinedButton) {
        return true;
      }
      return false;
    }));
    await tester.pumpAndSettle();
    expect(find.byWidgetPredicate((widget) {
      if (widget is SignUpScreen) {
        return true;
      }
      return false;
    }), findsOne);
  });
}
