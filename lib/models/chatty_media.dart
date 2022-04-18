import 'dart:convert';

class ChattyMedia {
  final String mediaURL;
  final String type;

  ChattyMedia({
    required this.mediaURL,
    required this.type,
  });

  ChattyMedia copyWith({
    String? mediaURL,
    String? type,
  }) =>
      ChattyMedia(
        mediaURL: mediaURL ?? this.mediaURL,
        type: type ?? this.type,
      );

  Map<String, dynamic> toMap() => {
        'mediaURL': mediaURL,
        'type': type,
      };

  factory ChattyMedia.fromMap(Map<String, dynamic> map) => ChattyMedia(
        mediaURL: map['mediaURL'] ?? '',
        type: map['type'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory ChattyMedia.fromJson(String source) => ChattyMedia.fromMap(json.decode(source));

  @override
  String toString() => 'ChattyMedia(mediaURL: $mediaURL, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChattyMedia && other.mediaURL == mediaURL && other.type == type;
  }

  @override
  int get hashCode => mediaURL.hashCode ^ type.hashCode;
}
