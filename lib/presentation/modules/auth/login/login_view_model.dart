import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../../../../domain/services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService;

  LoginViewModel(this._authService);

  Future<void> loginWithGoogle(BuildContext context) async {
    try {
      await _authService.loginWithGoogle();
      // Navigate to the next screen on successful login
    } catch (e) {
      // Handle the exception
    }
  }
}
