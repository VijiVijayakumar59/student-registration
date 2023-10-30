import 'package:flutter/material.dart';

class FormText extends StatelessWidget {
  final String textName;
  const FormText({
    super.key,
    required this.textName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textName,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
