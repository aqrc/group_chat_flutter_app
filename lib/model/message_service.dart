import 'package:cloud_firestore/cloud_firestore.dart';

import 'dto/message_dto.dart';

class MessageService {
  final _messagesCollection = FirebaseFirestore.instance
      .collection('messages')
      .withConverter<MessageDTO>(
        fromFirestore: (snapshots, _) => MessageDTO.fromJson(snapshots.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );

  Query<MessageDTO> queryMessages() {
    return _messagesCollection.orderBy('date', descending: true);
  }

  void sendMessage(String message) async {
    var messageDTO = MessageDTO(
      authorName: "Tester",
      message: message,
      date: Timestamp.now(),
    );

    await _messagesCollection.add(messageDTO);
  }
}
