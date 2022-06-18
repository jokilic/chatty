import 'dart:convert';

class ChattyChatUser {
  final String uid;
  final String displayName;
  final String userPhotoURL;
  final String lastMessage;
  final DateTime lastMessageTime;
  final bool lastMessageRead;
  final bool lastMessageOutgoing;

  ChattyChatUser({
    required this.uid,
    required this.displayName,
    required this.userPhotoURL,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.lastMessageRead,
    required this.lastMessageOutgoing,
  });

  ChattyChatUser copyWith({
    String? uid,
    String? displayName,
    String? userPhotoURL,
    String? lastMessage,
    DateTime? lastMessageTime,
    bool? lastMessageRead,
    bool? lastMessageOutgoing,
  }) =>
      ChattyChatUser(
        uid: uid ?? this.uid,
        displayName: displayName ?? this.displayName,
        userPhotoURL: userPhotoURL ?? this.userPhotoURL,
        lastMessage: lastMessage ?? this.lastMessage,
        lastMessageTime: lastMessageTime ?? this.lastMessageTime,
        lastMessageRead: lastMessageRead ?? this.lastMessageRead,
        lastMessageOutgoing: lastMessageOutgoing ?? this.lastMessageOutgoing,
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'displayName': displayName,
        'userPhotoURL': userPhotoURL,
        'lastMessage': lastMessage,
        'lastMessageTime': lastMessageTime.millisecondsSinceEpoch,
        'lastMessageRead': lastMessageRead,
        'lastMessageOutgoing': lastMessageOutgoing,
      };

  factory ChattyChatUser.fromMap(Map<String, dynamic> map) => ChattyChatUser(
        uid: map['uid'] ?? '',
        displayName: map['displayName'] ?? '',
        userPhotoURL: map['userPhotoURL'] ?? '',
        lastMessage: map['lastMessage'] ?? '',
        lastMessageTime: DateTime.fromMillisecondsSinceEpoch(map['lastMessageTime']),
        lastMessageRead: map['lastMessageRead'] ?? '',
        lastMessageOutgoing: map['lastMessageOutgoing'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory ChattyChatUser.fromJson(String source) => ChattyChatUser.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChattyChatUser(uid: $uid, displayName: $displayName, userPhotoURL: $userPhotoURL, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, lastMessageRead: $lastMessageRead, lastMessageOutgoing: $lastMessageOutgoing)';

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
        other.lastMessageTime == lastMessageTime &&
        other.lastMessageRead == lastMessageRead &&
        other.lastMessageOutgoing == lastMessageOutgoing;
  }

  @override
  int get hashCode =>
      uid.hashCode ^ displayName.hashCode ^ userPhotoURL.hashCode ^ lastMessage.hashCode ^ lastMessageTime.hashCode ^ lastMessageRead.hashCode ^ lastMessageOutgoing.hashCode;
}
