import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.find<OnboardingController>();

    return const Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Text(
          'Onboarding screen',
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
