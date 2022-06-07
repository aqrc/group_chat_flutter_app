import 'package:flutter/material.dart';

class NameInput extends StatelessWidget {
  const NameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      child: TextField(
        decoration: InputDecoration(
          disabledBorder: inputBorder,
          focusedBorder: inputBorder,
          errorBorder: inputBorder,
          enabledBorder: inputBorder,
          hintText: 'Enter your name here...',
        ),
      ),
    );
  }
}
