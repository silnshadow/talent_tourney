import '../repositories/auth_repository.dart';

class AuthService {
  final AuthRepository _authRepository;

  AuthService(this._authRepository);

  Future<void> loginWithGoogle() async {
    await _authRepository.loginWithGoogle();
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _authRepository.signUpWithEmailAndPassword(email, password);
  }

  Future<void> resetPassword(String email) async {
    await _authRepository.resetPassword(email);
  }
}
