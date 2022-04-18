import 'dart:convert';

class ChattyBlockedUser {
  final String userID;

  ChattyBlockedUser({
    required this.userID,
  });

  ChattyBlockedUser copyWith({
    String? userID,
  }) =>
      ChattyBlockedUser(
        userID: userID ?? this.userID,
      );

  Map<String, dynamic> toMap() => {
        'userID': userID,
      };

  factory ChattyBlockedUser.fromMap(Map<String, dynamic> map) => ChattyBlockedUser(
        userID: map['userID'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory ChattyBlockedUser.fromJson(String source) => ChattyBlockedUser.fromMap(json.decode(source));

  @override
  String toString() => 'ChattyBlockedUser(userID: $userID)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChattyBlockedUser && other.userID == userID;
  }

  @override
  int get hashCode => userID.hashCode;
}
