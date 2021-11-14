import 'package:flutter/material.dart';
import 'package:shindig/widgets/forms/form_button.dart';
import 'package:shindig/widgets/forms/form_text_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                children: const [
                  FormTextInput(
                    labelText: 'First name',
                    hintText: 'Enter your first name',
                  ),
                  FormTextInput(
                    labelText: 'Last name',
                    hintText: 'Enter your last name',
                  ),
                  FormTextInput(
                    labelText: 'Date of birth',
                    hintText: 'Enter your date of birth',
                  ),
                  FormTextInput(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  FormTextInput(
                    labelText: 'Password',
                    hintText: 'Create a password',
                  ),
                ],
              ),
            ),
            const FormButton(
              text: 'register',
            ),
            const FormButton(
              text: 'login',
            ),
          ],
        ),
      ),
    );
  }
}
