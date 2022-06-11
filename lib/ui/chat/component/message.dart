import 'package:flutter/material.dart';

import '../../../model/dto/message_dto.dart';

enum MessageType { incoming, outgoing }

class Message extends StatelessWidget {
  static const timeColor = Color(0xff50555c);
  static const incomingMessageBackgroundColor = Color(0xffededed);
  static const incomingMessageTextColor = Color(0xff000000);
  static const outgoingMessageTextColor = Color(0xffffffff);
  static const messageBorder = BorderRadius.all(Radius.circular(20));

  final MessageDTO messageDTO;
  final MessageType messageType;

  const Message({
    Key? key,
    required this.messageDTO,
    required this.messageType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _getNameRow(),
          const SizedBox(height: 7),
          DecoratedBox(
            decoration: BoxDecoration(
                color: _getMessageBackgroundColor(context),
                borderRadius: _getMessageBorder()),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Text(
                messageDTO.message,
                style: TextStyle(
                  color: _getMessageTextColor(),
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _getFormattedTime(),
            style: const TextStyle(
              fontSize: 13,
              color: timeColor,
            ),
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _getNameRow() {
    switch (messageType) {
      case MessageType.incoming:
        return Row(
          children: [
            Text(
              messageDTO.authorName,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        );

      case MessageType.outgoing:
        return const SizedBox(height: 25);
    }
  }

  Color _getMessageBackgroundColor(BuildContext context) {
    switch (messageType) {
      case MessageType.incoming:
        return incomingMessageBackgroundColor;

      case MessageType.outgoing:
        return Theme.of(context).primaryColor;
    }
  }

  Color _getMessageTextColor() {
    switch (messageType) {
      case MessageType.incoming:
        return incomingMessageTextColor;

      case MessageType.outgoing:
        return outgoingMessageTextColor;
    }
  }

  BorderRadius _getMessageBorder() {
    switch (messageType) {
      case MessageType.incoming:
        return messageBorder.copyWith(topLeft: Radius.zero);

      case MessageType.outgoing:
        return messageBorder.copyWith(topRight: Radius.zero);
    }
  }

  String _getFormattedTime() {
    var localDateTime = messageDTO.date.toDate().toLocal();
    var hours = _ensureTwoDigits(localDateTime.hour);
    var minutes = _ensureTwoDigits(localDateTime.minute);

    return "$hours:$minutes";
  }

  String _ensureTwoDigits(int time) {
    return (time < 10) ? "0$time" : "$time";
  }
}
