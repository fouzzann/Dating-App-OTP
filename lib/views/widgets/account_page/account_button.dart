import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';
import 'package:lilac_infotech_task_otp/views/screens/phone_auth_sreen.dart';
import 'package:lilac_infotech_task_otp/views/widgets/account_page/custom_signin_button.dart';

class AccountButtons extends StatelessWidget {
  const AccountButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSignInButton(
          text: 'Sign in with Google',
          useIcon: true,
          assetImage: 'assets/pngtree-google-internet-icon-vector-png-image_9183287.png',
          backgroundColor: AccountPageColors.googleButton,
          textColor: AccountPageColors.googleText,
          borderRadius: 120,
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        CustomSignInButton(
          text: 'Sign in with Facebook',
          useIcon: true,
          iconData: Icons.facebook,
          backgroundColor: AccountPageColors.facebook,
          textColor: Colors.white,
          borderRadius: 120,
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        CustomSignInButton(
          text: 'Sign in with phone number',
          useIcon: true,
          iconData: Icons.phone,
          backgroundColor: AccountPageColors.phoneButton,
          textColor: AccountPageColors.phoneText,
          borderRadius: 120,
          onPressed: () {
            Get.to(() =>  PhoneAuthPage(), transition: Transition.rightToLeft);
          },
        ),
      ],
    );
  }
}
