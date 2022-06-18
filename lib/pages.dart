import 'package:get/get.dart';

import 'constants/routes.dart';
import 'screens/chat/chat_binding.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/onboarding/onboarding_binding.dart';
import 'screens/onboarding/onboarding_screen.dart';

final pages = [
  GetPage(
    name: ChattyRoutes.onboardingScreen,
    page: OnboardingScreen.new,
    binding: OnboardingBinding(),
  ),
  GetPage(
    name: ChattyRoutes.chatScreen,
    page: ChatScreen.new,
    binding: ChatBinding(),
  ),
];
