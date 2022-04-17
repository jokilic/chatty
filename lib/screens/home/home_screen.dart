import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return const Scaffold(
      backgroundColor: Colors.amber,
    );
  }
}
