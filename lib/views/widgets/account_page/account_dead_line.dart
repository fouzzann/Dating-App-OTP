import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

class AccountHeadline extends StatelessWidget {
  const AccountHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Connect. Meet. Love.',
          style: TextStyle(
            color: AccountPageColors.headlineText,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'with Fliq Dating',
          style: TextStyle(
            color: AccountPageColors.headlineText,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
