import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shindig/providers/firebase_provider.dart';
import 'package:shindig/widgets/forms/form_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void handleLogin() async {
    try {
      final UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print('Email: $email');
      print('Password: $password');
      print('User: ${user.additionalUserInfo?.username}');
    } catch (err) {
      print('Error: $err');
    }
  }

  void handleRegister() {}
  late String email;
  late String password;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shindig'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        hintText: 'Enter your email',
                      ),
                      onChanged: (value) => email = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        hintText: 'Enter your password',
                      ),
                      onChanged: (value) => password = value,
                    ),
                  ),
                ],
              ),
            ),
            FormButton(
              text: 'login',
              onPressed: handleLogin,
            ),
            FormButton(
              text: 'register',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
