import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_infotech_task_otp/controllers/message_screen_controller.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';
import 'package:lilac_infotech_task_otp/views/screens/account_screen.dart';
import 'package:lilac_infotech_task_otp/views/widgets/message_screen/chat_list.dart';
import 'package:lilac_infotech_task_otp/views/widgets/message_screen/contact_row.dart';
import 'package:lilac_infotech_task_otp/views/widgets/message_screen/search_bar.dart';

class MessagesScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  MessagesScreen({Key? key}) : super(key: key);

  /// Shows a confirmation dialog for logout action
  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              child: const Text("No", style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: Colors.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Get.to(
                  () => AccountLoginScreen(),
                  transition: Transition.upToDown,
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () => _confirmLogout(context),
          ),
        ],
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text(
          'Messages',
          style: TextStyle(
            color: AppColors.appBarText,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.iconColor),
          onPressed: () {
            // You can add back navigation logic here
          },
        ),
      ),
      body: Column(
        children: [
          ContactRow(chatController: chatController),
          const SearchBarWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Chat',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.chatLabel,
                ),
              ),
            ),
          ),
          Expanded(child: const ChatListWidget()),
        ],
      ),
    );
  }
}
