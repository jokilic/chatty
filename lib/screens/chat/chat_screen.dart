import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../constants/text_styles.dart';
import '../../services/firestore_service.dart';
import 'chat_controller.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(32.r),
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
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: CircleAvatar(
                        radius: 32.r,
                        backgroundColor: Colors.white,
                        child: Obx(
                          () => Text(
                            Get.find<FirestoreService>().currentUser?.displayName.trim()[0] ?? '',
                            style: ChattyTextStyles.chatUserIconLetter,
                          ),
                        ),
                      ),
                    ),
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
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  radius: 32.r,
                                  backgroundColor: Colors.black,
                                  child: Text(
                                    chat?.displayName.trim()[0] ?? '',
                                    style: ChattyTextStyles.chatIconLetter,
                                  ),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      chat?.displayName ?? 'no name',
                                      style: ChattyTextStyles.chatUsername,
                                    ),
                                    SizedBox(height: 8.h),
                                  ],
                                ),
                                subtitle: Text(
                                  chat?.lastMessage ?? 'no message',
                                  style: ChattyTextStyles.chatMessage,
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      timeago.format(
                                        chat?.lastMessageTime ?? DateTime.now(),
                                        locale: 'en_short',
                                      ),
                                      style: ChattyTextStyles.chatTime,
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      chat?.userPhotoURL ?? 'no photo',
                                      style: ChattyTextStyles.chatTime,
                                    ),
                                  ],
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
