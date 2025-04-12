import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

class TermsPolicyText extends StatelessWidget {
  const TermsPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          color: AccountPageColors.termsText,
          fontSize: 12,
        ),
        children: [
          const TextSpan(text: 'By signing up, you agree to our '),
          TextSpan(
            text: 'Terms',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle Terms tap
              },
          ),
          const TextSpan(text: '. See how we use your data in our '),
          TextSpan(
            text: 'Privacy Policy',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Handle Privacy Policy tap
              },
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
