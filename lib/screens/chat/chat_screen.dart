import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/text_styles.dart';
import 'chat_controller.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(24.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Josip 👋🏼',
                          style: ChattyTextStyles.chatWelcome,
                        ),
                        Text(
                          'Chatty',
                          style: ChattyTextStyles.chatWelcomeChatty,
                        ),
                      ],
                    ),
                    const Icon(Icons.add),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28.r),
                    ),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 24.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent chats',
                        style: ChattyTextStyles.chatRecentChats,
                      ),
                      SizedBox(height: 24.h),
                      Expanded(
                        child: Get.find<ChatController>().obx(
                          (chats) => ListView.builder(
                            itemCount: chats?.length,
                            itemBuilder: (_, index) {
                              final chat = chats?[index];

                              return ListTile(
                                trailing: Text(
                                  chat?.userPhotoURL ?? 'no name',
                                ),
                                leading: Text(
                                  chat?.lastMessage ?? 'no idea',
                                  style: ChattyTextStyles.chatRecentChatsText,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
