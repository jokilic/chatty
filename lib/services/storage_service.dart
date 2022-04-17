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

  /// Inserts some value in Storage
  Future<void> insertValue({required String key, required value}) async => storageBox.write(key, value);

  /// Gets `String` value from Storage
  String getString({required String key, String defaultValue = ''}) => storageBox.read(key) ?? defaultValue;

  /// Gets `int` value from Storage
  int getInt({required String key, int defaultValue = -1}) => storageBox.read(key) ?? defaultValue;

  /// Gets `bool` value from Storage
  bool getBool({required String key, bool defaultValue = false}) => storageBox.read(key) ?? defaultValue;

  /// Returns a value which shows if some `key` has data
  bool doesExist({required String key}) => storageBox.hasData(key);

  /// Deletes one item
  Future<void> deleteValue({required String key}) async => storageBox.remove(key);

  /// Deletes everything from [Storage]
  Future<void> deleteAll() async => storageBox.erase();
}
