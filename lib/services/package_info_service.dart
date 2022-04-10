import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'logger_service.dart';

class PackageInfoService extends GetxService {
  final logger = Get.find<LoggerService>();

  /// ---------------------------
  /// VARIABLES
  /// ---------------------------

  ///
  late PackageInfo _packageInfo;
  PackageInfo get packageInfo => _packageInfo;
  set packageInfo(PackageInfo value) => _packageInfo = value;

  ///
  final _appName = ''.obs;
  String get appName => _appName.value;
  set appName(String value) => _appName.value = value;

  ///
  final _packageName = ''.obs;
  String get packageName => _packageName.value;
  set packageName(String value) => _packageName.value = value;

  ///
  final _version = ''.obs;
  String get version => _version.value;
  set version(String value) => _version.value = value;

  ///
  final _buildNumber = ''.obs;
  String get buildNumber => _buildNumber.value;
  set buildNumber(String value) => _buildNumber.value = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();
    packageInfo = await PackageInfo.fromPlatform();

    appName = packageInfo.appName;
    packageName = packageInfo.packageName;
    version = packageInfo.version;
    buildNumber = packageInfo.buildNumber;

    logger
      ..v('PACKAGE INFO')
      ..v('--------------------')
      ..v('AppName: $appName\nVersion: $version\nBuildNumber: $buildNumber')
      ..v('--------------------\n');
  }
}
