import 'dart:convert';

class ChattyMessage {
  final bool isOutgoing;
  final bool isRead;
  final DateTime timestamp;
  final String type;
  final String value;

  ChattyMessage({
    required this.isOutgoing,
    required this.isRead,
    required this.timestamp,
    required this.type,
    required this.value,
  });

  ChattyMessage copyWith({
    bool? isOutgoing,
    bool? isRead,
    DateTime? timestamp,
    String? type,
    String? value,
  }) =>
      ChattyMessage(
        isOutgoing: isOutgoing ?? this.isOutgoing,
        isRead: isRead ?? this.isRead,
        timestamp: timestamp ?? this.timestamp,
        type: type ?? this.type,
        value: value ?? this.value,
      );

  Map<String, dynamic> toMap() => {
        'isOutgoing': isOutgoing,
        'isRead': isRead,
        'timestamp': timestamp.millisecondsSinceEpoch,
        'type': type,
        'value': value,
      };

  factory ChattyMessage.fromMap(Map<String, dynamic> map) => ChattyMessage(
        isOutgoing: map['isOutgoing'] ?? false,
        isRead: map['isRead'] ?? false,
        timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp']),
        type: map['type'] ?? '',
        value: map['value'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory ChattyMessage.fromJson(String source) => ChattyMessage.fromMap(json.decode(source));

  @override
  String toString() => 'ChattyMessage(isOutgoing: $isOutgoing, isRead: $isRead, timestamp: $timestamp, type: $type, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChattyMessage && other.isOutgoing == isOutgoing && other.isRead == isRead && other.timestamp == timestamp && other.type == type && other.value == value;
  }

  @override
  int get hashCode => isOutgoing.hashCode ^ isRead.hashCode ^ timestamp.hashCode ^ type.hashCode ^ value.hashCode;
}
