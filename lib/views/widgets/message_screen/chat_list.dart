// widget file: chat_list.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';
import 'package:lilac_infotech_task_otp/views/screens/chat_screen.dart';

class ChatListWidget extends StatelessWidget {
  const ChatListWidget({Key? key}) : super(key: key);

  /// Widget to display list of chat users with recent messages
  @override
  Widget build(BuildContext context) {
    // Mock chat list data
    List<Map<String, dynamic>> mockChatList = [
      {
        'name': 'Regina Bearden',
        'lastMessage': 'Hey, how are you doing?',
        'time': '10:00 AM',
        'imageUrl': 'https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg',
      },
      {
        'name': 'Rhonda Rivera',
        'lastMessage': 'See you tomorrow!',
        'time': '10:00 AM',
        'imageUrl': 'https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg',
      },
      {
        'name': 'Mary Gratton',
        'lastMessage': 'Thanks for the info!',
        'time': '10:00 AM',
        'imageUrl': 'https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg',
      },
      {
        'name': 'Annie Medved',
        'lastMessage': 'I got the package!',
        'time': '10:00 AM',
        'imageUrl': 'https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg',
      },
      {
        'name': 'Regina Bearden',
        'lastMessage': 'Looking forward to it.',
        'time': '10:00 AM',
        'imageUrl': 'https://fliq-test-bucket.s3.ap-south-1.amazonaws.com/10/conversions/gYlvYiE8ZeK2ZawVmcvL4oWkzion23fnhz44440s-square300.jpg',
      },
    ];

    return ListView.builder(
      itemCount: mockChatList.length,
      itemBuilder: (context, index) {
        final chat = mockChatList[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(chat['imageUrl']),
          ),
          title: Text(
            chat['name'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            chat['lastMessage'],
            style: TextStyle(color: AppColors.subtitle, fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            chat['time'],
            style: TextStyle(color: AppColors.time, fontSize: 12),
          ),
          onTap: () {
            Get.to(
              () => ChatDetailScreen(
                userName: chat['name'],
                userImage: chat['imageUrl'],
              ),
            );
          },
        );
      },
    );
  }
}
