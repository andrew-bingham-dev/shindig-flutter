import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shindig/providers/firebase_provider.dart';
import 'package:shindig/screens/main_screen.dart';
import 'package:shindig/screens/login_screen.dart';

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
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<FirebaseProvider>(
                create: (context) => FirebaseProvider(),
              )
            ],
            child: MaterialApp(
              title: 'Shindig',
              theme: ThemeData.dark(),
              home: const App(),
            ),
          );
        }
        return MaterialApp(
          title: 'Shindig',
          theme: ThemeData.dark(),
          home: const Scaffold(
              body: Center(child: Text('Checking authentication...'))),
        );
      },
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          FirebaseAuth _auth = FirebaseAuth.instance;
          if (snapshot.connectionState == ConnectionState.active) {
            if (_auth.currentUser != null) {
              Provider.of<FirebaseProvider>(context, listen: false)
                  .updateUserFromFirebase();
              return MainScreen();
            }
            print('Connection state: ${snapshot.connectionState}');
            print('Current user: ${_auth.currentUser?.email}');
          }
          return const LoginScreen();
        });
  }
}
