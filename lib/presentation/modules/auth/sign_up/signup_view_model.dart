import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../../../domain/services/auth_service.dart';
import '../../../../utils/general_helper.dart';

class SignUpViewModel extends ChangeNotifier {
  final AuthService _authService;

  SignUpViewModel(this._authService);

  Future<void> signUpWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      await _authService.signUpWithEmailAndPassword(email, password);
      // Navigate to the next screen on successful sign up
    } catch (e) {
      GeneralHelper.handleException(context, e as Exception);
    }
  }
}
