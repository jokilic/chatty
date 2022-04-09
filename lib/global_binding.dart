import 'package:get/get.dart';

import 'services/package_info_service.dart';
import 'services/storage_service.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(PackageInfoService())
      ..put(StorageService());
  }
}
