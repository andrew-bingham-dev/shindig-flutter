import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shindig/screens/home_screen.dart';
import 'package:shindig/screens/login_screen.dart';
import 'package:shindig/screens/register_screen.dart';

void main() {
  runApp(AppSetup());
}

class AppSetup extends StatefulWidget {
  @override
  State<AppSetup> createState() => _AppSetupState();
}

class _AppSetupState extends State<AppSetup> {
  final Future<FirebaseApp> _initialisation = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialisation,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              title: 'Shindig', theme: ThemeData.dark(), home: const App());
        }
        return MaterialApp(
            title: 'Shindig',
            theme: ThemeData.dark(),
            home: const Text('Loading...'));
      },
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
