import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  final String text;
  const FormButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(text.toUpperCase()),
      ),
    );
  }
}
