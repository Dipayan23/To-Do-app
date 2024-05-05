import 'package:flutter/material.dart';
import 'package:to_do/utiles/myButton.dart';

// ignore: must_be_immutable
class dialog_box extends StatelessWidget {
  final text_controll;
  VoidCallback onSaved;
  VoidCallback onCancel;
  dialog_box({
    super.key,
    required this.text_controll,
    required this.onSaved,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: text_controll,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                my_button(text: "ADD", onChanged: onSaved),
                my_button(text: "CLEAR", onChanged: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
