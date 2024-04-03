import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
    viewModel.fetchUsers(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Talent Tourney'),
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          final users = viewModel.users;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                title: Text(user.username),
                subtitle: Text(user.email),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Navigate to attachments screen for the user
                  },
                  child: const Text('Attachments'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
