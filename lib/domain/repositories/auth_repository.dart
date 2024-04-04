abstract class AuthRepository {
  Future<void> loginWithGoogle();
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> resetPassword(String email);
}
