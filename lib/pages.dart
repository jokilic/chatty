import 'package:get/get.dart';

import 'screens/home/home_binding.dart';
import 'screens/home/home_screen.dart';

final pages = [
  GetPage(
    name: HomeScreen.routeName,
    page: HomeScreen.new,
    binding: HomeBinding(),
  ),
];
