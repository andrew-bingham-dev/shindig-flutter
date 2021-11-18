import 'package:flutter/material.dart';
import 'package:shindig/widgets/forms/form_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void handleRegister() {}

  void handleLogin() {}

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shindig'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text('First name'),
                        hintText: 'Enter your first name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text('Last name'),
                        hintText: 'Enter your last name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text('Date of birth'),
                        hintText: 'Enter your date of birth',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        hintText: 'Enter your email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        hintText: 'Create a password',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FormButton(
              text: 'register',
              onPressed: handleRegister,
            ),
            FormButton(
              text: 'login',
              onPressed: handleLogin,
            ),
          ],
        ),
      ),
    );
  }
}
