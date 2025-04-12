import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_infotech_task_otp/controllers/otp_controller.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';
import 'package:lilac_infotech_task_otp/views/widgets/otp_screen/otp_header.dart';
import 'package:lilac_infotech_task_otp/views/widgets/otp_screen/otp_input_filed.dart';
import 'package:lilac_infotech_task_otp/views/widgets/otp_screen/phone_number_text.dart';
import 'package:lilac_infotech_task_otp/views/widgets/otp_screen/resent_text.dart';
import 'package:lilac_infotech_task_otp/views/widgets/otp_screen/verify_button.dart';

class OtpScreen extends StatelessWidget {
  final String phoneNumber;
  final String verificationid;
  final OtpController controller = Get.put(OtpController());

  OtpScreen({
    super.key,
    required this.verificationid,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OtpColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: OtpColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: OtpColors.textPrimary),
          onPressed: () => Get.back(),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const OtpHeader(), // Separated widget for title
              PhoneNumberText(phoneNumber: phoneNumber), // Phone + Edit
              const SizedBox(height: 10),
              OtpInputField(
                // OTP Input
                controller: controller,
                verificationId: verificationid,
              ),
              const SizedBox(height: 16),
              const ResendText(), // Resend option
              const Spacer(),
              VerifyButton(
                // Bottom verify button
                controller: controller,
                verificationId: verificationid,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
