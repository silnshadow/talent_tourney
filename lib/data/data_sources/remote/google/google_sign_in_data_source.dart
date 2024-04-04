import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInDataSource {
  final GoogleSignIn _googleSignIn;

  GoogleSignInDataSource(this._googleSignIn);

  Future<void> signIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (e) {
      throw Exception('Failed to sign in with Google: $e');
    }
  }
}
