import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  static const textStyleOverride = TextStyle(fontSize: 18);

  const ChatInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
    );

    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x1a000000),
            blurRadius: 4,
            offset: Offset(0, -4),
          )
        ],
      ),
      child: Container(
        height: 59,
        padding: const EdgeInsets.all(3),
        color: Colors.white,
        child: TextField(
          style: textStyleOverride,
          decoration: InputDecoration(
            disabledBorder: inputBorder,
            focusedBorder: inputBorder,
            errorBorder: inputBorder,
            enabledBorder: inputBorder,
            hintText: 'Type your message here...',
            hintStyle: textStyleOverride,
          ),
        ),
      ),
    );
  }
}
