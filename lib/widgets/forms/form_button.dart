import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const FormButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(text.toUpperCase()),
      ),
    );
  }
}
