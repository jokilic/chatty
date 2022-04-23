import 'dart:convert';

class ChattyChat {
  final String userID;

  ChattyChat({
    required this.userID,
  });

  ChattyChat copyWith({
    String? userID,
  }) =>
      ChattyChat(
        userID: userID ?? this.userID,
      );

  Map<String, dynamic> toMap() => {
        'userID': userID,
      };

  factory ChattyChat.fromMap(Map<String, dynamic> map) => ChattyChat(
        userID: map['userID'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory ChattyChat.fromJson(String source) => ChattyChat.fromMap(json.decode(source));

  @override
  String toString() => 'ChattyChat(userID: $userID)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChattyChat && other.userID == userID;
  }

  @override
  int get hashCode => userID.hashCode;
}
