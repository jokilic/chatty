// ignore_for_file: unnecessary_lambdas

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'chatty_blocked_user.dart';
import 'chatty_chat.dart';
import 'chatty_favorite_user.dart';
import 'chatty_media.dart';

class ChattyUser {
  final int age;
  final String appVersion;
  final List<ChattyBlockedUser> blockedUsers;
  final List<ChattyChat> chats;
  final String description;
  final String device;
  final String displayName;
  final String email;
  final String facebook;
  final List<ChattyFavoriteUser> favoriteUsers;
  final String instagram;
  final bool isOnline;
  final DateTime lastSeenOnline;
  final double latitude;
  final double longitude;
  final List<ChattyMedia> media;
  final String phoneNumber;
  final String photoURL;
  final String twitter;
  final String uid;

  ChattyUser({
    required this.age,
    required this.appVersion,
    required this.blockedUsers,
    required this.chats,
    required this.description,
    required this.device,
    required this.displayName,
    required this.email,
    required this.facebook,
    required this.favoriteUsers,
    required this.instagram,
    required this.isOnline,
    required this.lastSeenOnline,
    required this.latitude,
    required this.longitude,
    required this.media,
    required this.phoneNumber,
    required this.photoURL,
    required this.twitter,
    required this.uid,
  });

  ChattyUser copyWith({
    int? age,
    String? appVersion,
    List<ChattyBlockedUser>? blockedUsers,
    List<ChattyChat>? chats,
    String? description,
    String? device,
    String? displayName,
    String? email,
    String? facebook,
    List<ChattyFavoriteUser>? favoriteUsers,
    String? instagram,
    bool? isOnline,
    DateTime? lastSeenOnline,
    double? latitude,
    double? longitude,
    List<ChattyMedia>? media,
    String? phoneNumber,
    String? photoURL,
    String? twitter,
    String? uid,
  }) =>
      ChattyUser(
        age: age ?? this.age,
        appVersion: appVersion ?? this.appVersion,
        blockedUsers: blockedUsers ?? this.blockedUsers,
        chats: chats ?? this.chats,
        description: description ?? this.description,
        device: device ?? this.device,
        displayName: displayName ?? this.displayName,
        email: email ?? this.email,
        facebook: facebook ?? this.facebook,
        favoriteUsers: favoriteUsers ?? this.favoriteUsers,
        instagram: instagram ?? this.instagram,
        isOnline: isOnline ?? this.isOnline,
        lastSeenOnline: lastSeenOnline ?? this.lastSeenOnline,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        media: media ?? this.media,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        photoURL: photoURL ?? this.photoURL,
        twitter: twitter ?? this.twitter,
        uid: uid ?? this.uid,
      );

  Map<String, dynamic> toMap() => {
        'age': age,
        'appVersion': appVersion,
        'blockedUsers': blockedUsers.map((x) => x.toMap()).toList(),
        'chats': chats.map((x) => x.toMap()).toList(),
        'description': description,
        'device': device,
        'displayName': displayName,
        'email': email,
        'facebook': facebook,
        'favoriteUsers': favoriteUsers.map((x) => x.toMap()).toList(),
        'instagram': instagram,
        'isOnline': isOnline,
        'lastSeenOnline': lastSeenOnline.millisecondsSinceEpoch,
        'latitude': latitude,
        'longitude': longitude,
        'media': media.map((x) => x.toMap()).toList(),
        'phoneNumber': phoneNumber,
        'photoURL': photoURL,
        'twitter': twitter,
        'uid': uid,
      };

  factory ChattyUser.fromMap(Map<String, dynamic> map) => ChattyUser(
        age: map['age']?.toInt() ?? 0,
        appVersion: map['appVersion'] ?? '',
        blockedUsers: List<ChattyBlockedUser>.from(map['blockedUsers']?.map((x) => ChattyBlockedUser.fromMap(x))),
        chats: List<ChattyChat>.from(map['chats']?.map((x) => ChattyChat.fromMap(x))),
        description: map['description'] ?? '',
        device: map['device'] ?? '',
        displayName: map['displayName'] ?? '',
        email: map['email'] ?? '',
        facebook: map['facebook'] ?? '',
        favoriteUsers: List<ChattyFavoriteUser>.from(map['favoriteUsers']?.map((x) => ChattyFavoriteUser.fromMap(x))),
        instagram: map['instagram'] ?? '',
        isOnline: map['isOnline'] ?? false,
        lastSeenOnline: DateTime.fromMillisecondsSinceEpoch(map['lastSeenOnline']),
        latitude: map['latitude']?.toDouble() ?? 0.0,
        longitude: map['longitude']?.toDouble() ?? 0.0,
        media: List<ChattyMedia>.from(map['media']?.map((x) => ChattyMedia.fromMap(x))),
        phoneNumber: map['phoneNumber'] ?? '',
        photoURL: map['photoURL'] ?? '',
        twitter: map['twitter'] ?? '',
        uid: map['uid'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory ChattyUser.fromJson(String source) => ChattyUser.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChattyUser(age: $age, appVersion: $appVersion, blockedUsers: $blockedUsers, chats: $chats, description: $description, device: $device, displayName: $displayName, email: $email, facebook: $facebook, favoriteUsers: $favoriteUsers, instagram: $instagram, isOnline: $isOnline, lastSeenOnline: $lastSeenOnline, latitude: $latitude, longitude: $longitude, media: $media, phoneNumber: $phoneNumber, photoURL: $photoURL, twitter: $twitter, uid: $uid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChattyUser &&
        other.age == age &&
        other.appVersion == appVersion &&
        listEquals(other.blockedUsers, blockedUsers) &&
        listEquals(other.chats, chats) &&
        other.description == description &&
        other.device == device &&
        other.displayName == displayName &&
        other.email == email &&
        other.facebook == facebook &&
        listEquals(other.favoriteUsers, favoriteUsers) &&
        other.instagram == instagram &&
        other.isOnline == isOnline &&
        other.lastSeenOnline == lastSeenOnline &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        listEquals(other.media, media) &&
        other.phoneNumber == phoneNumber &&
        other.photoURL == photoURL &&
        other.twitter == twitter &&
        other.uid == uid;
  }

  @override
  int get hashCode =>
      age.hashCode ^
      appVersion.hashCode ^
      blockedUsers.hashCode ^
      chats.hashCode ^
      description.hashCode ^
      device.hashCode ^
      displayName.hashCode ^
      email.hashCode ^
      facebook.hashCode ^
      favoriteUsers.hashCode ^
      instagram.hashCode ^
      isOnline.hashCode ^
      lastSeenOnline.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      media.hashCode ^
      phoneNumber.hashCode ^
      photoURL.hashCode ^
      twitter.hashCode ^
      uid.hashCode;
}
