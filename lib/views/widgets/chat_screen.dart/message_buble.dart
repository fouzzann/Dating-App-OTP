// widget file: message_bubble.dart
import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

/// Widget representing a single chat message bubble
class MessageBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.time,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isMe
                    ? ChatColors.messageOutgoing
                    : ChatColors.messageIncoming,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: isMe
                      ? ChatColors.messageOutgoingText
                      : ChatColors.messageIncomingText,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style:
                  const TextStyle(color: ChatColors.timeText, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
