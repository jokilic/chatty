import 'dart:convert';

class ChattyUser {
  final int age;
  final String appVersion;
  final String description;
  final String device;
  final String displayName;
  final String email;
  final String facebook;
  final String instagram;
  final bool isOnline;
  final DateTime lastSeenOnline;
  final double latitude;
  final double longitude;
  final String phoneNumber;
  final String photoURL;
  final String twitter;
  final String uid;

  ChattyUser({
    required this.age,
    required this.appVersion,
    required this.description,
    required this.device,
    required this.displayName,
    required this.email,
    required this.facebook,
    required this.instagram,
    required this.isOnline,
    required this.lastSeenOnline,
    required this.latitude,
    required this.longitude,
    required this.phoneNumber,
    required this.photoURL,
    required this.twitter,
    required this.uid,
  });

  ChattyUser copyWith({
    int? age,
    String? appVersion,
    String? description,
    String? device,
    String? displayName,
    String? email,
    String? facebook,
    String? instagram,
    bool? isOnline,
    DateTime? lastSeenOnline,
    double? latitude,
    double? longitude,
    String? phoneNumber,
    String? photoURL,
    String? twitter,
    String? uid,
  }) =>
      ChattyUser(
        age: age ?? this.age,
        appVersion: appVersion ?? this.appVersion,
        description: description ?? this.description,
        device: device ?? this.device,
        displayName: displayName ?? this.displayName,
        email: email ?? this.email,
        facebook: facebook ?? this.facebook,
        instagram: instagram ?? this.instagram,
        isOnline: isOnline ?? this.isOnline,
        lastSeenOnline: lastSeenOnline ?? this.lastSeenOnline,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        photoURL: photoURL ?? this.photoURL,
        twitter: twitter ?? this.twitter,
        uid: uid ?? this.uid,
      );

  Map<String, dynamic> toMap() => {
        'age': age,
        'appVersion': appVersion,
        'description': description,
        'device': device,
        'displayName': displayName,
        'email': email,
        'facebook': facebook,
        'instagram': instagram,
        'isOnline': isOnline,
        'lastSeenOnline': lastSeenOnline.millisecondsSinceEpoch,
        'latitude': latitude,
        'longitude': longitude,
        'phoneNumber': phoneNumber,
        'photoURL': photoURL,
        'twitter': twitter,
        'uid': uid,
      };

  factory ChattyUser.fromMap(Map<String, dynamic> map) => ChattyUser(
        age: map['age']?.toInt() ?? 0,
        appVersion: map['appVersion'] ?? '',
        description: map['description'] ?? '',
        device: map['device'] ?? '',
        displayName: map['displayName'] ?? '',
        email: map['email'] ?? '',
        facebook: map['facebook'] ?? '',
        instagram: map['instagram'] ?? '',
        isOnline: map['isOnline'] ?? false,
        lastSeenOnline: DateTime.fromMillisecondsSinceEpoch(map['lastSeenOnline']),
        latitude: map['latitude']?.toDouble() ?? 0.0,
        longitude: map['longitude']?.toDouble() ?? 0.0,
        phoneNumber: map['phoneNumber'] ?? '',
        photoURL: map['photoURL'] ?? '',
        twitter: map['twitter'] ?? '',
        uid: map['uid'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory ChattyUser.fromJson(String source) => ChattyUser.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChattyUser(age: $age, appVersion: $appVersion, description: $description, device: $device, displayName: $displayName, email: $email, facebook: $facebook, instagram: $instagram, isOnline: $isOnline, lastSeenOnline: $lastSeenOnline, latitude: $latitude, longitude: $longitude, phoneNumber: $phoneNumber, photoURL: $photoURL, twitter: $twitter, uid: $uid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChattyUser &&
        other.age == age &&
        other.appVersion == appVersion &&
        other.description == description &&
        other.device == device &&
        other.displayName == displayName &&
        other.email == email &&
        other.facebook == facebook &&
        other.instagram == instagram &&
        other.isOnline == isOnline &&
        other.lastSeenOnline == lastSeenOnline &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.phoneNumber == phoneNumber &&
        other.photoURL == photoURL &&
        other.twitter == twitter &&
        other.uid == uid;
  }

  @override
  int get hashCode =>
      age.hashCode ^
      appVersion.hashCode ^
      description.hashCode ^
      device.hashCode ^
      displayName.hashCode ^
      email.hashCode ^
      facebook.hashCode ^
      instagram.hashCode ^
      isOnline.hashCode ^
      lastSeenOnline.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      phoneNumber.hashCode ^
      photoURL.hashCode ^
      twitter.hashCode ^
      uid.hashCode;
}
