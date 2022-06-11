import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

@immutable
class MessageDTO {
  final String authorName;
  final String message;
  final Timestamp date;
  final String? authorUid;

  const MessageDTO({
    required this.authorName,
    required this.authorUid,
    required this.message,
    required this.date,
  });

  MessageDTO.fromJson(Map<String, Object?> json)
      : this(
          authorName: json['authorName']! as String,
          authorUid: json['authorUid'] as String?,
          message: json['message']! as String,
          date: json['date']! as Timestamp,
        );

  Map<String, Object?> toJson() {
    return {
      'authorName': authorName,
      'authorUid': authorUid,
      'message': message,
      'date': date,
    };
  }
}
