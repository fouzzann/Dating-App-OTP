// page file: chat_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';
import 'package:lilac_infotech_task_otp/views/widgets/chat_screen.dart/app_bar.dart';
import 'package:lilac_infotech_task_otp/views/widgets/chat_screen.dart/date_indicator.dart';
import 'package:lilac_infotech_task_otp/views/widgets/chat_screen.dart/message_buble.dart';
import 'package:lilac_infotech_task_otp/views/widgets/chat_screen.dart/message_input_filed.dart';

/// Chat detail screen that displays the conversation UI and input field
class ChatDetailScreen extends StatefulWidget {
  final String userName;
  final String userImage;
  final bool isOnline;

  const ChatDetailScreen({
    Key? key,
    required this.userName,
    required this.userImage,
    this.isOnline = false,
  }) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController messageController = TextEditingController();
  final String currentUserId = '55';

  // Mock data for chat messages
  final List<Map<String, dynamic>> mockMessages = [
    {'senderId': '55', 'message': 'Hi', 'time': '10:00 AM'},
  ];

  void _sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    setState(() {
      mockMessages.add({
        'senderId': currentUserId,
        'message': messageController.text,
        'time': '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')} AM',
      });
    });

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ChatColors.appBarBackground,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ChatAppBar(
          userName: widget.userName,
          userImage: widget.userImage,
          isOnline: widget.isOnline,
          onBack: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: ChatColors.bodyBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  const DateIndicator(),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: mockMessages.length,
                      itemBuilder: (context, index) {
                        final message = mockMessages[index];
                        final isMe = message['senderId'] == currentUserId;
                        return MessageBubble(
                          message: message['message'],
                          time: message['time'],
                          isMe: isMe,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          MessageInputField(
            controller: messageController,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
