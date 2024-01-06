import 'package:flutter/material.dart';
import 'package:front/ui/signup/sign_up_screen.dart';

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
                  onPressed: () => {}, child: const Text("Log in"))),
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
