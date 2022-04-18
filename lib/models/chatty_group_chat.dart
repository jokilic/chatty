// ignore_for_file: unnecessary_lambdas

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'chatty_message.dart';

class ChattyGroupChat {
  final List<ChattyMessage> messages;
  final String groupName;
  final String groupPhotoURL;

  ChattyGroupChat({
    required this.messages,
    required this.groupName,
    required this.groupPhotoURL,
  });

  ChattyGroupChat copyWith({
    List<ChattyMessage>? messages,
    String? groupName,
    String? groupPhotoURL,
  }) =>
      ChattyGroupChat(
        messages: messages ?? this.messages,
        groupName: groupName ?? this.groupName,
        groupPhotoURL: groupPhotoURL ?? this.groupPhotoURL,
      );

  Map<String, dynamic> toMap() => {
        'messages': messages.map((x) => x.toMap()).toList(),
        'groupName': groupName,
        'groupPhotoURL': groupPhotoURL,
      };

  factory ChattyGroupChat.fromMap(Map<String, dynamic> map) => ChattyGroupChat(
        messages: List<ChattyMessage>.from(map['messages']?.map((x) => ChattyMessage.fromMap(x))),
        groupName: map['groupName'] ?? '',
        groupPhotoURL: map['groupPhotoURL'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory ChattyGroupChat.fromJson(String source) => ChattyGroupChat.fromMap(json.decode(source));

  @override
  String toString() => 'ChattyGroupChat(messages: $messages, groupName: $groupName, groupPhotoURL: $groupPhotoURL)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChattyGroupChat && listEquals(other.messages, messages) && other.groupName == groupName && other.groupPhotoURL == groupPhotoURL;
  }

  @override
  int get hashCode => messages.hashCode ^ groupName.hashCode ^ groupPhotoURL.hashCode;
}
