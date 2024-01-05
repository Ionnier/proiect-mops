import 'package:flutter/material.dart';

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
                  onPressed: () => {}, child: const Text("Sign up"))),
          const SizedBox(height: 16),
        ],
      ),
    ));
  }
}
