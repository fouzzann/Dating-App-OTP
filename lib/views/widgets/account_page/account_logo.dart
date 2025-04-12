import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

class AccountLogo extends StatelessWidget {
  const AccountLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AccountPageColors.logoCircle,
        ),
        child: const Image(
          image: AssetImage('assets/image-removebg-preview.png'),
        ),
      ),
    );
  }
}
