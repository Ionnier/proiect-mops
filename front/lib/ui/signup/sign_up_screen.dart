import 'package:flutter/material.dart';
import 'package:form_validation/form_validation.dart';
import 'package:front/ui/dashboard/dashboard_screen.dart';
import 'package:front/ui/signup/signup_vm.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _ssnController = TextEditingController();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpViewModel>(builder: (context, viewModel, child) {
      Future.delayed(Duration.zero, () {
        if (viewModel.wasLoggedInSuccesfully) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        }
      });

      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () => {Navigator.pop(context)},
                icon: const Icon(Icons.arrow_back))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
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
                        const MinLengthValidator(length: 8),
                      ],
                    );

                    return validator.validate(
                      label: 'Password',
                      value: value,
                    );
                  },
                ),
                const SizedBox(
                  height: 4,
                ),
                createFormField(_firstNameController, "First Name"),
                const SizedBox(
                  height: 4,
                ),
                createFormField(_lastNameController, "Last Name"),
                const SizedBox(
                  height: 4,
                ),
                createFormField(_addressController, "Address"),
                const SizedBox(
                  height: 4,
                ),
                createFormField(_ssnController, "SSN"),
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
                                      viewModel.signup(
                                          _emailController.text,
                                          _passwordController.text,
                                          _firstNameController.text,
                                          _lastNameController.text,
                                          _addressController.text,
                                          _ssnController.text);
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
    });
  }

  Widget createFormField(TextEditingController controller, String s) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: s,
      ),
      controller: controller,
      validator: (value) {
        final validator = Validator(
          validators: [
            const RequiredValidator(),
          ],
        );

        return validator.validate(
          label: s,
          value: value,
        );
      },
    );
  }
}
