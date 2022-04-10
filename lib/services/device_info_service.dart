import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

import 'logger_service.dart';

class DeviceInfoService extends GetxService {
  final logger = Get.find<LoggerService>();

  /// ------------------------
  /// VARIABLES
  /// ------------------------

  ///
  late DeviceInfoPlugin _deviceInfo;
  DeviceInfoPlugin get deviceInfo => _deviceInfo;
  set deviceInfo(DeviceInfoPlugin value) => _deviceInfo = value;

  ///
  AndroidDeviceInfo? _androidInfo;
  AndroidDeviceInfo? get androidInfo => _androidInfo;
  set androidInfo(AndroidDeviceInfo? value) => _androidInfo = value;

  ///
  IosDeviceInfo? _iOSInfo;
  IosDeviceInfo? get iOSInfo => _iOSInfo;
  set iOSInfo(IosDeviceInfo? value) => _iOSInfo = value;

  ///
  WebBrowserInfo? _webBrowserInfo;
  WebBrowserInfo? get webBrowserInfo => _webBrowserInfo;
  set webBrowserInfo(WebBrowserInfo? value) => _webBrowserInfo = value;

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();

    deviceInfo = DeviceInfoPlugin();
    await initProperInfo();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  Future<void> initProperInfo() async {
    if (GetPlatform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
      logger
        ..v('DEVICE INFO')
        ..v('--------------------')
        ..v('Platform: Android')
        ..v('--------------------\n');
    }
    if (GetPlatform.isIOS) {
      iOSInfo = await deviceInfo.iosInfo;
      logger
        ..v('DEVICE INFO')
        ..v('--------------------')
        ..v('Platform: iOS')
        ..v('--------------------\n');
    }
    if (GetPlatform.isWeb) {
      webBrowserInfo = await deviceInfo.webBrowserInfo;
      logger
        ..v('DEVICE INFO')
        ..v('--------------------')
        ..v('Platform: Web')
        ..v('--------------------\n');
    }
  }
}
