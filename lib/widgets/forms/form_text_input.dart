import 'package:flutter/material.dart';

class FormTextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  const FormTextInput(
      {Key? key, required this.labelText, required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          label: Text(labelText),
          hintText: hintText,
        ),
      ),
    );
  }
}
