import 'package:flutter/material.dart';
import 'package:front/data/auth_repository.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthRepository authRepository;
  bool isLoading = false;
  bool wasLoggedInSuccesfully = false;
  String? errorMessage;

  SignUpViewModel({required this.authRepository});

  void signup(String email, String password, String firstName, String lastName,
      String address, String ssn) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    notifyListeners();
    var error = await authRepository.signup(
        email, password, firstName, lastName, address, ssn);
    errorMessage = error;
    if (error == null) {
      wasLoggedInSuccesfully = true;
    }
    isLoading = false;
    notifyListeners();
  }
}
