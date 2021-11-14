import 'package:flutter/material.dart';
import 'package:shindig/screens/login_screen.dart';
import 'package:shindig/screens/register_screen.dart';

void main() {
  runApp(const AppSetup());
}

class AppSetup extends StatelessWidget {
  const AppSetup({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shindig',
      theme: ThemeData.dark(),
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RegisterScreen();
  }
}
