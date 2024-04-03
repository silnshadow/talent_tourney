import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/modules/home/home_screen.dart';
import 'dependencies.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Dependencies.getProviders(),
      child: MaterialApp(
        title: 'Talent Tourney',
        home: const HomeScreen(),
      ),
    );
  }
}
