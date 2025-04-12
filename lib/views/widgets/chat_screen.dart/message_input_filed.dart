// widget file: message_input_field.dart
import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

/// Message input field widget used at the bottom of the chat screen
class MessageInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const MessageInputField({
    Key? key,
    required this.controller,
    required this.onSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: ChatColors.containerBackground,
        border: Border(
          top: BorderSide(color: ChatColors.borderColor, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ChatColors.messageInputBackground,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: onSend,
                    icon: const Icon(
                      Icons.send_rounded,
                      color: ChatColors.sendButtonIcon,
                    ),
                  ),
                  hintText: 'Type a message...',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  border: InputBorder.none,
                ),
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
