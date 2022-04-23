import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/chatty_chat.dart';
import '../models/chatty_media.dart';
import '../models/chatty_message.dart';
import '../models/chatty_user.dart';
import 'auth_service.dart';

class FirestoreService extends GetxService {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  late final FirebaseFirestore firestore;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
    firestore = FirebaseFirestore.instance;
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// Adds [ChattyUser] in [Firestore]
  Future<void> addUser({required ChattyUser user}) async {
    /// Get [Users] `reference`
    final usersRef = firestore.collection('users').withConverter<ChattyUser>(
          fromFirestore: (snapshot, _) => ChattyUser.fromMap(snapshot.data()!),
          toFirestore: (user, _) => user.toMap(),
        );

    /// Store a [ChattyUser] in [Firestore]
    await usersRef.doc(user.uid).set(user);
  }

  /// Adds [ChattyChat] in [Firestore]
  Future<void> addNewChat({required ChattyChat chat}) async {
    final userID = Get.find<AuthService>().currentUser?.uid;

    /// Get [Chats] `reference`
    final userChatsRef = firestore.collection('users').doc(userID).collection('chats').withConverter<ChattyChat>(
          fromFirestore: (snapshot, _) => ChattyChat.fromMap(snapshot.data()!),
          toFirestore: (chat, _) => chat.toMap(),
        );

    /// Store a [ChattyChat] in [Firestore]
    await userChatsRef.doc(chat.userID).set(chat);
  }

  /// Adds [ChattyMessage] in [Firestore] (both users)
  Future<void> addNewMessage({required ChattyMessage message, required String otherUserID}) async {
    final userID = Get.find<AuthService>().currentUser?.uid;

    /// Get [Messages] `reference` for current user
    final userMessagesRef = firestore.collection('users').doc(userID).collection('chats').doc(otherUserID).withConverter<ChattyMessage>(
          fromFirestore: (snapshot, _) => ChattyMessage.fromMap(snapshot.data()!),
          toFirestore: (message, _) => message.toMap(),
        );

    /// Get [Messages] `reference` for other user
    final otherUserMessagesRef = firestore.collection('users').doc(otherUserID).collection('chats').doc(userID).withConverter<ChattyMessage>(
          fromFirestore: (snapshot, _) => ChattyMessage.fromMap(snapshot.data()!),
          toFirestore: (message, _) => message.toMap(),
        );

    /// Store a [ChattyMessage] for current user in [Firestore]
    await userMessagesRef.set(message);

    /// Store a [ChattyMessage] for other user in [Firestore]
    await otherUserMessagesRef.set(message);
  }

  /// Adds [ChattyMedia] in [Firestore]
  Future<void> addNewMedia({required ChattyMedia media}) async {
    final userID = Get.find<AuthService>().currentUser?.uid;

    /// Get [Media] `reference` for current user
    final userMediaRef = firestore.collection('users').doc(userID).collection('media').withConverter<ChattyMedia>(
          fromFirestore: (snapshot, _) => ChattyMedia.fromMap(snapshot.data()!),
          toFirestore: (media, _) => media.toMap(),
        );

    /// Store a [ChattyMedia] for current user in [Firestore]
    await userMediaRef.add(media);
  }
}
