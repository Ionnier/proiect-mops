import 'package:flutter/material.dart';
import 'package:front/data/auth_repository.dart';
import 'package:front/data/settings.dart';
import 'package:front/ui/login/login_screen.dart';
import 'package:front/ui/login/login_vm.dart';
import 'package:front/ui/signup/sign_up_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Icon(
            Icons.book,
            size: 256,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: FilledButton(
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (context) => LoginViewModel(
                                  authRepository: AuthRepository(
                                      AuthServiceImpl(
                                          dio: Settings().provideDio()),
                                      Settings())),
                              child: LoginScreen(),
                            ),
                          ),
                        )
                      },
                  child: const Text("Log in"))),
          const SizedBox(height: 4),
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        )
                      },
                  child: const Text("Sign up"))),
          const SizedBox(height: 16),
        ],
      ),
    ));
  }
}
