import 'package:flutter/material.dart';

// ignore: must_be_immutable
class my_button extends StatelessWidget {
  VoidCallback onChanged;
  final String text;

  my_button({
    super.key,
    required this.text,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onChanged,
      child: Text(text),
      color: Colors.pink[200],
    );
  }
}
