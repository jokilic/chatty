import 'dart:convert';

class ChattyFavoriteUser {
  final String userID;

  ChattyFavoriteUser({
    required this.userID,
  });

  ChattyFavoriteUser copyWith({
    String? userID,
  }) =>
      ChattyFavoriteUser(
        userID: userID ?? this.userID,
      );

  Map<String, dynamic> toMap() => {
        'userID': userID,
      };

  factory ChattyFavoriteUser.fromMap(Map<String, dynamic> map) => ChattyFavoriteUser(
        userID: map['userID'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory ChattyFavoriteUser.fromJson(String source) => ChattyFavoriteUser.fromMap(json.decode(source));

  @override
  String toString() => 'ChattyFavoriteUser(userID: $userID)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChattyFavoriteUser && other.userID == userID;
  }

  @override
  int get hashCode => userID.hashCode;
}
