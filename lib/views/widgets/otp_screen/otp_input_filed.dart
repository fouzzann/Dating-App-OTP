import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/controllers/otp_controller.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

/// Displays the OTP input field using `pin_code_fields`
class OtpInputField extends StatelessWidget {
  final OtpController controller;
  final String verificationId;

  const OtpInputField({
    super.key,
    required this.controller,
    required this.verificationId,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      controller: controller.otpController,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 50,
        fieldWidth: 50,
        activeColor: OtpColors.gradientEnd,
        inactiveColor: OtpColors.borderColor,
        selectedColor: OtpColors.gradientStart,
      ),
      onChanged: (value) {
        controller.otpController.text = value;
      },
      onCompleted: (value) {
        controller.verifyOtp(verificationId);
      },
    );
  }
}
