// widget file: chat_app_bar.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

/// Custom AppBar for ChatDetailScreen showing user avatar, name and online status
class ChatAppBar extends StatelessWidget {
  final String userName;
  final String userImage;
  final bool isOnline;
  final VoidCallback onBack;

  const ChatAppBar({
    Key? key,
    required this.userName,
    required this.userImage,
    required this.isOnline,
    required this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          const SizedBox(width: 10),
          Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: ChatColors.backButtonContainer,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, size: 20),
              color: ChatColors.backButtonIcon,
              onPressed: onBack,
              padding: EdgeInsets.zero,
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(userImage),
            radius: 18,
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  color: AppColors.appBarText,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    isOnline ? 'Online' : 'Offline',
                    style: const TextStyle(color: AppColors.subtitle, fontSize: 12),
                  ),
                  const SizedBox(width: 4),
                  if (isOnline)
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: ChatColors.onlineIndicator,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
