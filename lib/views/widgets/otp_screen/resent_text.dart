import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

/// Text with "Resend" link for OTP
class ResendText extends StatelessWidget {
  const ResendText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "Didn't get anything? No worries, let's try again.\n",
                style: TextStyle(
                  color: OtpColors.textPrimary,
                  fontSize: 14,
                ),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () {
                    // TODO: Implement resend functionality
                  },
                  child: const Text(
                    'Resend',
                    style: TextStyle(
                      color: Colors.blue,
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
