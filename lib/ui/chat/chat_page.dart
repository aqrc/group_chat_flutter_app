import 'package:flutter/material.dart';
import 'package:groupchat/ui/chat/component/message.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat room',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: ListView.builder(
        reverse: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          var messageType = (index % 3 == 2) // just for testing
              ? MessageType.outgoing
              : MessageType.incoming;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Message(
              name: 'Andrey',
              message: 'Message $index',
              time: '18:${30 - index}',
              messageType: messageType,
            ),
            alignment: _getMessageAlignment(messageType),
          );
        },
      ),
    );
  }

  Alignment _getMessageAlignment(MessageType messageType) {
    switch (messageType) {
      case MessageType.incoming:
        return Alignment.centerLeft;

      case MessageType.outgoing:
        return Alignment.centerRight;
    }
  }
}