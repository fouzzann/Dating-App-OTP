import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

/// Shows the phone number and allows editing it by going back
class PhoneNumberText extends StatelessWidget {
  final String phoneNumber;

  const PhoneNumberText({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$phoneNumber. ',
                style: const TextStyle(
                  color: OtpColors.textPrimary,
                  fontSize: 16,
                ),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      color: OtpColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
