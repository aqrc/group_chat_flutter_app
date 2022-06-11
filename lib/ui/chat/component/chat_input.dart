import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/message_service.dart';

class ChatInput extends StatefulWidget {
  const ChatInput({Key? key}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  static const _textStyleOverride = TextStyle(fontSize: 18);
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Theme
          .of(context)
          .primaryColor),
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
          controller: _controller,
          onEditingComplete: () {
            context.read<MessageService>().sendMessage(_controller.value.text);
            _controller.clear();
          },
          style: _textStyleOverride,
          decoration: InputDecoration(
            disabledBorder: inputBorder,
            focusedBorder: inputBorder,
            errorBorder: inputBorder,
            enabledBorder: inputBorder,
            hintText: 'Type your message here...',
            hintStyle: _textStyleOverride,
          ),
        ),
      ),
    );
  }
}
