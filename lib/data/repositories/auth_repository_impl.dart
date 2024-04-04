import '../../domain/repositories/auth_repository.dart';
import '../../services/auth/firebase_auth_service.dart';
import '../data_sources/remote/google/google_sign_in_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final GoogleSignInDataSource _googleSignInDataSource;
  final FirebaseAuthService _firebaseAuthService;

  AuthRepositoryImpl(this._googleSignInDataSource, this._firebaseAuthService);

  @override
  Future<void> loginWithGoogle() async {
    await _googleSignInDataSource.signIn();
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _firebaseAuthService.signUpWithEmailAndPassword(email, password);
  }

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuthService.resetPassword(email);
  }
}
