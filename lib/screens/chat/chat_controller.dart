import 'package:get/get.dart';

import '../../models/chatty_chat_user.dart';
import '../../models/chatty_user.dart';
import '../../services/auth_service.dart';
import '../../services/device_info_service.dart';
import '../../services/firestore_service.dart';
import '../../services/package_info_service.dart';

class ChatController extends GetxController with StateMixin<List<ChattyChatUser>> {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  ///
  final _chats = <ChattyChatUser>[].obs;
  List<ChattyChatUser> get chats => _chats;
  set chats(List<ChattyChatUser> value) => _chats.assignAll(value);

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
    await loginUser();
    chats = await Get.find<FirestoreService>().getChats();
    change(chats, status: RxStatus.success());
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<void> loginUser() async {
    final authService = Get.find<AuthService>();

    /// Login user in [Firebase]
    final userSignedSuccessfully = await authService.signIn(
      email: 'email@mail.com',
      password: '0000000',
    );

    if (userSignedSuccessfully) {
      /// TODO: Update 'appVersion', 'device', 'isOnline', 'lastSeenOnline', 'latitude' and 'longitude'

    } else {
      /// TODO: User failed to login

    }
  }

  Future<void> createUser() async {
    final authService = Get.find<AuthService>();
    final firestoreService = Get.find<FirestoreService>();

    /// Create a user in [Firebase]
    final newFirebaseUser = await authService.registerUser(
      email: 'email2@mail.com',
      password: '0000000',
    );

    if (newFirebaseUser != null) {
      /// Create a [ChattyUser] model
      final newUser = ChattyUser(
        age: 20,
        appVersion: Get.find<PackageInfoService>().version,
        description: 'Some desc',
        device: Get.find<DeviceInfoService>().androidInfo?.device ?? 'no_device',
        displayName: 'some name',
        email: newFirebaseUser.user?.email ?? 'no_email',
        facebook: 'some facebook',
        instagram: 'some instagram',
        isOnline: true,
        lastSeenOnline: DateTime.now(),
        latitude: 12,
        longitude: 12,
        phoneNumber: '00000221',
        photoURL: 'some url',
        twitter: 'some twitter',
        uid: newFirebaseUser.user?.uid ?? 'no_uid',
      );

      /// Store the user in [Firestore]
      await firestoreService.addUser(user: newUser);

      /// Go to [MainScreen]

    } else {
      /// TODO: User failed to register
    }
  }
}
