import 'dart:convert';

class ChattyChatUser {
  final String uid;
  final String displayName;
  final String userPhotoURL;
  final String lastMessage;
  final DateTime lastMessageTime;

  ChattyChatUser({
    required this.uid,
    required this.displayName,
    required this.userPhotoURL,
    required this.lastMessage,
    required this.lastMessageTime,
  });

  ChattyChatUser copyWith({
    String? uid,
    String? displayName,
    String? userPhotoURL,
    String? lastMessage,
    DateTime? lastMessageTime,
  }) =>
      ChattyChatUser(
        uid: uid ?? this.uid,
        displayName: displayName ?? this.displayName,
        userPhotoURL: userPhotoURL ?? this.userPhotoURL,
        lastMessage: lastMessage ?? this.lastMessage,
        lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'displayName': displayName,
        'userPhotoURL': userPhotoURL,
        'lastMessage': lastMessage,
        'lastMessageTime': lastMessageTime.millisecondsSinceEpoch,
      };

  factory ChattyChatUser.fromMap(Map<String, dynamic> map) => ChattyChatUser(
        uid: map['uid'] ?? '',
        displayName: map['displayName'] ?? '',
        userPhotoURL: map['userPhotoURL'] ?? '',
        lastMessage: map['lastMessage'] ?? '',
        lastMessageTime: DateTime.fromMillisecondsSinceEpoch(map['lastMessageTime']),
      );

  String toJson() => json.encode(toMap());

  factory ChattyChatUser.fromJson(String source) => ChattyChatUser.fromMap(json.decode(source));

  @override
  String toString() => 'ChattyChatUser(uid: $uid, displayName: $displayName, userPhotoURL: $userPhotoURL, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChattyChatUser &&
        other.uid == uid &&
        other.displayName == displayName &&
        other.userPhotoURL == userPhotoURL &&
        other.lastMessage == lastMessage &&
        other.lastMessageTime == lastMessageTime;
  }

  @override
  int get hashCode => uid.hashCode ^ displayName.hashCode ^ userPhotoURL.hashCode ^ lastMessage.hashCode ^ lastMessageTime.hashCode;
}
