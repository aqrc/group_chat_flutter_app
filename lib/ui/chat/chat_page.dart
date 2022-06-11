import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groupchat/model/message_service.dart';
import 'package:groupchat/ui/chat/component/message.dart';
import 'package:provider/provider.dart';

import '../../model/dto/message_dto.dart';
import 'component/chat_input.dart';

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
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 59),
            child: StreamBuilder<QuerySnapshot<MessageDTO>>(
                stream: context.read<MessageService>().queryMessages().snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final data = snapshot.requireData;

                  return ListView.builder(
                    reverse: true,
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      var messageDTO = data.docs[index].data();
                      var messageType = context.read<MessageService>().defineMessageType(messageDTO);

                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Message(
                          messageDTO: messageDTO,
                          messageType: messageType,
                        ),
                        alignment: _getMessageAlignment(messageType),
                      );
                    },
                  );
                }),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: ChatInput(),
          ),
        ],
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
