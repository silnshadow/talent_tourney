import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../data/data_sources/remote/firebase/firebase_user_data_source.dart';
import '../data/data_sources/remote/google/google_sign_in_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/user_repository.dart';
import '../domain/services/auth_service.dart';
import '../domain/services/user_service.dart';
import '../presentation/modules/auth/login/login_view_model.dart';
import '../presentation/modules/auth/sign_up/signup_view_model.dart';
import '../presentation/modules/home/home_view_model.dart';
import '../services/auth/firebase_auth_service.dart';
import '../services/auth/google_sign_in_service.dart';

class Dependencies {
  static List<SingleChildWidget> getProviders() {
    return [
      // Providers for various dependencies...

      Provider<FirebaseFirestore>(create: (_) => FirebaseFirestore.instance),
      Provider<FirebaseAuth>(create: (_) => FirebaseAuth.instance),
      Provider<GoogleSignIn>(create: (_) => GoogleSignIn()),
      Provider<FirebaseUserDataSource>(
        create: (context) =>
            FirebaseUserDataSource(context.read<FirebaseFirestore>()),
      ),
      Provider<GoogleSignInDataSource>(
        create: (context) =>
            GoogleSignInDataSource(context.read<GoogleSignIn>()),
      ),
      Provider<UserRepository>(
        create: (context) =>
            UserRepositoryImpl(context.read<FirebaseUserDataSource>()),
      ),
      Provider<FirebaseAuthService>(
        create: (context) => FirebaseAuthService(context.read<FirebaseAuth>()),
      ),
      Provider<AuthRepository>(
        create: (context) => AuthRepositoryImpl(
          context.read<GoogleSignInDataSource>(),
          context.read<FirebaseAuthService>(),
        ),
      ),
      Provider<UserService>(
        create: (context) => UserService(context.read<UserRepository>()),
      ),
      Provider<AuthService>(
        create: (context) => AuthService(context.read<AuthRepository>()),
      ),
      Provider<GoogleSignInService>(
        create: (context) => GoogleSignInService(context.read<GoogleSignIn>()),
      ),
      // Only provide LoginViewModel once
      ChangeNotifierProvider<HomeViewModel>(
        create: (context) => HomeViewModel(context.read<UserService>()),
      ),
      ChangeNotifierProvider<SignUpViewModel>(
        create: (context) => SignUpViewModel(context.read<AuthService>()),
      ),
      ChangeNotifierProvider<LoginViewModel>(
        create: (context) => LoginViewModel(context.read<AuthService>()),
      ),
    ];
  }
}
