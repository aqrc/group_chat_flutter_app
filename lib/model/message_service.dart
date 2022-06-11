import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groupchat/ui/chat/component/message.dart';

import 'dto/message_dto.dart';
import 'state/app_state.dart';

class MessageService {
  final AppState _appState;

  MessageService(this._appState);

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
      authorName: _appState.name,
      authorUid: await _appState.userId,
      message: message,
      date: Timestamp.now(),
    );

    await _messagesCollection.add(messageDTO);
  }

  MessageType defineMessageType(MessageDTO messageDTO) {
    if (messageDTO.authorUid == _appState.userId) {
      return MessageType.outgoing;
    } else {
      return MessageType.incoming;
    }
  }
}
