import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

/// Displays the "Enter your verification code" title
class OtpHeader extends StatelessWidget {
  const OtpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Center(
          child: Text(
            'Enter your verification',
            style: TextStyle(
              color: OtpColors.textPrimary,
              fontWeight: FontWeight.w800,
              fontSize: 26,
            ),
          ),
        ),
        Center(
          child: Text(
            'code',
            style: TextStyle(
              color: OtpColors.textPrimary,
              fontWeight: FontWeight.w800,
              fontSize: 26,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
