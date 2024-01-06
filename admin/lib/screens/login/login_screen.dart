import 'package:admin/screens/home/home_screen.dart';
import 'package:admin/screens/login/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, vm, child) {
        if (vm.isLoggedIn) {
          Future.delayed(Duration.zero, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          });
        }
        return Scaffold(
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  if (vm.hadError)
                    const Text(
                      "An error occured. Please check provided information",
                      style: TextStyle(color: Colors.red),
                    ),
                  ElevatedButton(
                      onPressed: () {
                        if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          return;
                        }
                        vm.login(
                            _emailController.text, _passwordController.text);
                      },
                      child: vm.isLoading
                          ? const SizedBox(
                              height: 16,
                              child: CircularProgressIndicator(),
                            )
                          : const Text("Login"))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
