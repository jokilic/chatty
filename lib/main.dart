import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants/strings.dart';
import 'global_binding.dart';
import 'pages.dart';
import 'screens/home/home_screen.dart';
import 'services/logger_service.dart';
import 'theme.dart';

void main() {
  /// Initialize relevant services
  Get.put(LoggerService());

  /// Run the `Chatty` app
  runApp(ChattyApp());
}

class ChattyApp extends StatelessWidget {
  final logger = Get.find<LoggerService>();

  /// Logs everything using [Logger] package
  void loggingWithLogger(String text, {bool isError = false}) => isError ? logger.e(text) : logger.d(text);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(412, 892),
        builder: () => GetMaterialApp(
          title: ChattyStrings.appName,
          theme: themeData,
          initialRoute: HomeScreen.routeName,
          initialBinding: GlobalBinding(),
          getPages: pages,
          logWriterCallback: loggingWithLogger,
          defaultTransition: Transition.fadeIn,
          scrollBehavior: const ScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
          ),
        ),
      );
}
