import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  ///
  late GetStorage _storageBox;
  GetStorage get storageBox => _storageBox;
  set storageBox(GetStorage value) => _storageBox = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
    storageBox = GetStorage();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  /// TODO: Implement get, insert, delete, delete all

}
