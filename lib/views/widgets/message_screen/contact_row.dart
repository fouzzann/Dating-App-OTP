// widget file: contact_row.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lilac_infotech_task_otp/controllers/message_screen_controller.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

class ContactRow extends StatelessWidget {
  final ChatController chatController;

  const ContactRow({Key? key, required this.chatController}) : super(key: key);

  /// Widget that shows a horizontal list of online contacts with profile pictures
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Obx(() {
        if (chatController.isLoading.value && chatController.contacts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: chatController.contacts.length,
          itemBuilder: (context, index) {
            final contact = chatController.contacts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: CachedNetworkImageProvider(contact.profilePhotoUrl),
                      ),
                      if (contact.isOnline)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              color: AppColors.onlineIndicator,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.background,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    contact.name.length > 10 ? '${contact.name.substring(0, 8)}...' : contact.name,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
