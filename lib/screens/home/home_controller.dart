import 'package:get/get.dart';

import '../../models/chatty_user.dart';
import '../../services/auth_service.dart';
import '../../services/device_info_service.dart';
import '../../services/firestore_service.dart';
import '../../services/package_info_service.dart';

class HomeController extends GetxController {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
    await createUser();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<void> createUser() async {
    final authService = Get.find<AuthService>();
    final firestoreService = Get.find<FirestoreService>();

    /// Create a user in [Firebase]
    final newFirebaseUser = await authService.registerUser(
      email: 'email@mail.com',
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
    }
  }
}
