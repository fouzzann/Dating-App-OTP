import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/views/widgets/account_page/account_button.dart';
import 'package:lilac_infotech_task_otp/views/widgets/account_page/account_dead_line.dart';
import 'package:lilac_infotech_task_otp/views/widgets/account_page/account_logo.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';
import 'package:lilac_infotech_task_otp/views/widgets/account_page/terms_and_polysis.dart';

class AccountLoginScreen extends StatelessWidget {
  const AccountLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/misson task image.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  AccountPageColors.backgroundOverlay,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Spacer(flex: 2),
                  AccountLogo(),
                  SizedBox(height: 24),
                  AccountHeadline(),
                  Spacer(flex: 18),
                  AccountButtons(),
                  SizedBox(height: 24),
                  TermsPolicyText(),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
