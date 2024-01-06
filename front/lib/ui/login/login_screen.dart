import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';
import 'package:front/ui/login/login_vm.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, child) {
        Future.delayed(Duration.zero, () {
          if (viewModel.wasLoggedInSuccesfully) {
            print("Should move next screen");
          }
        });

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    controller: _emailController,
                    validator: (value) {
                      final validator = Validator(
                        validators: [
                          const RequiredValidator(),
                          const EmailValidator(),
                        ],
                      );

                      return validator.validate(
                        label: 'Email',
                        value: value,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      final validator = Validator(
                        validators: [
                          const RequiredValidator(),
                        ],
                      );

                      return validator.validate(
                        label: 'Password',
                        value: value,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (viewModel.errorMessage != null)
                    Text(
                      viewModel.errorMessage!,
                      selectionColor: Theme.of(context).colorScheme.error,
                      textAlign: TextAlign.start,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      viewModel.isLoading
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2))
                          : ElevatedButton(
                              onPressed: viewModel.isLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        viewModel.login(_emailController.text,
                                            _passwordController.text);
                                      }
                                    },
                              child: const Text("Submit"))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
