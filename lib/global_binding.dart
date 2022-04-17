import 'package:get/get.dart';

import 'services/app_lifecycle_service.dart';
import 'services/device_info_service.dart';
import 'services/hive_service.dart';
import 'services/location_service.dart';
import 'services/package_info_service.dart';
import 'services/path_provider_service.dart';
import 'services/storage_service.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(AppLifecycleService())
      ..put(DeviceInfoService())
      ..put(PackageInfoService())
      ..put(StorageService())
      ..put(HiveService())
      ..put(LocationService())
      ..put(PathProviderService());
  }
}
