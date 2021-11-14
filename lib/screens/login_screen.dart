import 'package:flutter/material.dart';
import 'package:shindig/widgets/forms/form_button.dart';
import 'package:shindig/widgets/forms/form_text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
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
                children: const [
                  FormTextInput(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  FormTextInput(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ],
              ),
            ),
            const FormButton(
              text: 'login',
            ),
            const FormButton(
              text: 'register',
            ),
          ],
        ),
      ),
    );
  }
}
