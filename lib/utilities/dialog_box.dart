import 'package:flutter/material.dart';
import 'package:todoflutterapp/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText: "Type here..."),
            ),
            //Save button and cancel button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              MyButton(text: "Save", onPressed: onSave),
              const SizedBox(width: 4,),
              MyButton(text: "Cancel", onPressed: onCancel),
            ],

            )
          ],),
      ),
    );
  }
}

