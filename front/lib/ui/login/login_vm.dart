import 'package:flutter/material.dart';
import 'package:front/data/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository authRepository;
  bool isLoading = false;
  bool wasLoggedInSuccesfully = false;
  String? errorMessage;

  LoginViewModel({required this.authRepository});

  void login(String email, String password) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    notifyListeners();
    var error = await authRepository.login(email, password);
    errorMessage = error;
    if (error == null) {
      wasLoggedInSuccesfully = true;
    }
    isLoading = false;
    notifyListeners();
  }
}
