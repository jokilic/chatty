// ignore_for_file: unnecessary_lambdas

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'chatty_message.dart';

class ChattyChat {
  final List<ChattyMessage> messages;
  final String userID;

  ChattyChat({
    required this.messages,
    required this.userID,
  });

  ChattyChat copyWith({
    List<ChattyMessage>? messages,
    String? userID,
  }) =>
      ChattyChat(
        messages: messages ?? this.messages,
        userID: userID ?? this.userID,
      );

  Map<String, dynamic> toMap() => {
        'messages': messages.map((x) => x.toMap()).toList(),
        'userID': userID,
      };

  factory ChattyChat.fromMap(Map<String, dynamic> map) => ChattyChat(
        messages: List<ChattyMessage>.from(map['messages']?.map((x) => ChattyMessage.fromMap(x))),
        userID: map['userID'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory ChattyChat.fromJson(String source) => ChattyChat.fromMap(json.decode(source));

  @override
  String toString() => 'ChattyChat(messages: $messages, userID: $userID)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChattyChat && listEquals(other.messages, messages) && other.userID == userID;
  }

  @override
  int get hashCode => messages.hashCode ^ userID.hashCode;
}
