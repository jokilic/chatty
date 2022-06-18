import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_controller.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatController = Get.find<ChatController>();

    return const Scaffold(
      backgroundColor: Colors.indigo,
    );
  }
}
