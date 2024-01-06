import 'package:admin/data/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;
  bool isLoggedIn = false;
  bool isLoading = false;
  bool hadError = false;

  LoginViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;

  Future<void> login(String email, String password) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    notifyListeners();
    var errorMessage = await _authRepository.login(email, password);
    if (errorMessage != null) {
      hadError = true;
    } else {
      isLoggedIn = true;
    }
    isLoading = false;
    notifyListeners();
  }
}
