import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.find<OnboardingController>();

    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Center(
        child: Column(
          children: [
            TextField(),
            TextField(),
          ],
        ),
      ),
    );
  }
}
