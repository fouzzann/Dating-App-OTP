import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_infotech_task_otp/controllers/otp_controller.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

/// Bottom "Verify" button with loading indicator
class VerifyButton extends StatelessWidget {
  final OtpController controller;
  final String verificationId;

  const VerifyButton({
    super.key,
    required this.controller,
    required this.verificationId,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              OtpColors.gradientStart,
              OtpColors.gradientEnd,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: ElevatedButton(
          onPressed: controller.isLoading.value
              ? null
              : () => controller.verifyOtp(verificationId),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: OtpColors.buttonText,
                )
              : const Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: OtpColors.buttonText,
                  ),
                ),
        ),
      ),
    );
  }
}
