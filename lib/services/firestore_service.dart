import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/chatty_chat.dart';
import '../models/chatty_chat_user.dart';
import '../models/chatty_media.dart';
import '../models/chatty_message.dart';
import '../models/chatty_user.dart';
import 'auth_service.dart';
import 'logger_service.dart';

class FirestoreService extends GetxService {
  final logger = Get.find<LoggerService>();

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

    logger
      ..v('FIRESTORE SERVICE')
      ..v('--------------------')
      ..v('User added to Firestore')
      ..v('$user')
      ..v('--------------------\n');
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

    logger
      ..v('FIRESTORE SERVICE')
      ..v('--------------------')
      ..v('New Chat added to Firestore')
      ..v('UserID: $userID - OtherUserID: ${chat.userID}')
      ..v('$chat')
      ..v('--------------------\n');
  }

  /// Adds [ChattyMessage] in [Firestore] (both users)
  Future<void> addNewMessage({required ChattyMessage message, required String otherUserID}) async {
    final userID = Get.find<AuthService>().currentUser?.uid;

    /// Get [Messages] `reference` for current user
    final userMessagesRef = firestore.collection('users').doc(userID).collection('chats').doc(otherUserID).collection('messages').withConverter<ChattyMessage>(
          fromFirestore: (snapshot, _) => ChattyMessage.fromMap(snapshot.data()!),
          toFirestore: (message, _) => message.toMap(),
        );

    /// Get [Messages] `reference` for other user
    final otherUserMessagesRef = firestore.collection('users').doc(otherUserID).collection('chats').doc(userID).collection('messages').withConverter<ChattyMessage>(
          fromFirestore: (snapshot, _) => ChattyMessage.fromMap(snapshot.data()!),
          toFirestore: (message, _) => message.toMap(),
        );

    /// Store a [ChattyMessage] for current user in [Firestore]
    await userMessagesRef.add(message);

    /// Store a [ChattyMessage] for other user in [Firestore]
    await otherUserMessagesRef.add(message);

    logger
      ..v('FIRESTORE SERVICE')
      ..v('--------------------')
      ..v('New Message added to Firestore')
      ..v('UserID: $userID - OtherUserID: $otherUserID')
      ..v('$message')
      ..v('--------------------\n');
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

    logger
      ..v('FIRESTORE SERVICE')
      ..v('--------------------')
      ..v('New Media added to Firestore')
      ..v('UserID: $userID')
      ..v('$media')
      ..v('--------------------\n');
  }

  /// Fetches [ChattyChats] list from [Firestore]
  Future<void> getChats() async {
    final userID = Get.find<AuthService>().currentUser?.uid;

    /// Get [Chats] [QuerySnapshot]
    final userChatsQuerySnapshot = await firestore
        .collection('users')
        .doc(userID)
        .collection('chats')
        .withConverter<ChattyChat>(
          fromFirestore: (snapshot, _) => ChattyChat.fromMap(snapshot.data()!),
          toFirestore: (chat, _) => chat.toMap(),
        )
        .get();

    /// Parse fetched list to [List<ChattyChat>]
    final chats = userChatsQuerySnapshot.docs.map((chat) => chat.data()).toList();

    /// Create a list of [List<ChattyChatUser>] from all `chats`
    final users = chats.map((user) async {
      final chattyChatUser = await createChattyChatUser(user: user);
      return chattyChatUser;
    }).toList();
  }

  /// Returns a [ChattyChatUser]
  Future<ChattyChatUser> createChattyChatUser({required ChattyChat user}) async {
    final chattyMessage = await getLatestMessage(otherUserID: user.userID);
    final chattyUser = await getUserFromID(userID: user.userID);

    final chatUser = ChattyChatUser(
      uid: user.userID,
      displayName: chattyUser?.displayName ?? 'no_name',
      lastMessage: chattyMessage.value,
      lastMessageTime: chattyMessage.timestamp,
    );

    return chatUser;
  }

  /// Returns [ChattyUser] from passed `userID`
  Future<ChattyUser?> getUserFromID({required String userID}) async {
    /// Get [User] `reference`
    final userRef = await firestore
        .collection('users')
        .doc(userID)
        .withConverter<ChattyUser>(
          fromFirestore: (snapshot, _) => ChattyUser.fromMap(snapshot.data()!),
          toFirestore: (user, _) => user.toMap(),
        )
        .get();

    final user = userRef.data();
    return user;
  }

  /// Returns latest [ChattyMessage] from passed `otherUserID`
  Future<ChattyMessage> getLatestMessage({required String otherUserID}) async {
    final userID = Get.find<AuthService>().currentUser?.uid;

    final otherUserMessagesRef = await firestore
        .collection('users')
        .doc(userID)
        .collection('chats')
        .doc(otherUserID)
        .collection('messages')
        .withConverter<ChattyMessage>(
          fromFirestore: (snapshot, _) => ChattyMessage.fromMap(snapshot.data()!),
          toFirestore: (message, _) => message.toMap(),
        )
        .orderBy('timestamp')
        .limit(1)
        .get();

    final message = otherUserMessagesRef.docs.first.data();
    return message;
  }

  /// Fetches [ChattyMessage] list from [Firestore]
  Future<void> getMessages({required String otherUserID}) async {
    final userID = Get.find<AuthService>().currentUser?.uid;

    /// Get [Messages] `reference` for current user
    final userMessagesRef = firestore.collection('users').doc(userID).collection('chats').doc(otherUserID).collection('messages').withConverter<ChattyMessage>(
          fromFirestore: (snapshot, _) => ChattyMessage.fromMap(snapshot.data()!),
          toFirestore: (message, _) => message.toMap(),
        );
  }
}
