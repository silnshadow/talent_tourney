import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                viewModel.loginWithGoogle(context);
              },
              child: const Text('Login with Google'),
            ),
          );
        },
      ),
    );
  }
}
