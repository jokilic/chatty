import 'package:get/get.dart';

import 'constants/routes.dart';
import 'screens/home/home_binding.dart';
import 'screens/home/home_screen.dart';
import 'screens/onboarding/onboarding_binding.dart';
import 'screens/onboarding/onboarding_screen.dart';

final pages = [
  GetPage(
    name: ChattyRoutes.onboardingScreen,
    page: OnboardingScreen.new,
    binding: OnboardingBinding(),
  ),
  GetPage(
    name: ChattyRoutes.homeScreen,
    page: HomeScreen.new,
    binding: HomeBinding(),
  ),
];
