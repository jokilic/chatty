import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constants/strings.dart';
import 'global_binding.dart';
import 'services/logger_service.dart';

void main() {
  /// Initialize relevant services
  Get.put(LoggerService());

  /// Run the `Chatty` app
  runApp(Chatty());
}

class Chatty extends StatelessWidget {
  final logger = Get.find<LoggerService>();

  /// Logs everything using [Logger] package
  void loggingWithLogger(String text, {bool isError = false}) => isError ? logger.e(text) : logger.d(text);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(412, 892),
        builder: () => GetMaterialApp(
          title: ChattyStrings.appName,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
          logWriterCallback: loggingWithLogger,
          defaultTransition: Transition.fadeIn,
          initialBinding: GlobalBinding(),
          scrollBehavior: const ScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
          ),
        ),
      );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Yoyo'),
        ),
        body: const Center(
          child: Text(
            'Wasssup??',
          ),
        ),
      );
}
