import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lilac_infotech_task_otp/controllers/phone_controller.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';
import 'package:lilac_infotech_task_otp/views/widgets/phone_auth/action_button.dart';
import 'package:lilac_infotech_task_otp/views/widgets/phone_auth/phone_input.dart';
import 'package:lilac_infotech_task_otp/views/widgets/phone_auth/show_top_snack_bar.dart';

class PhoneAuthPage extends StatelessWidget {
  PhoneAuthPage({super.key});

  final PhoneAuthController controller = Get.put(PhoneAuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PhoneAuthColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
        elevation: 0,
        backgroundColor: PhoneAuthColors.background,
        iconTheme: const IconThemeData(color: PhoneAuthColors.textPrimary),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Title Section
                  const Center(
                    child: Column(
                      children: [
                        Text(
                          'Enter your phone',
                          style: TextStyle(
                            color: PhoneAuthColors.textPrimary,
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                        Text(
                          'number',
                          style: TextStyle(
                            color: PhoneAuthColors.textPrimary,
                            fontWeight: FontWeight.w800,
                            fontSize: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Phone number input field
                  PhoneInputField(
                    onChanged: (phoneNumber) {
                      controller.completePhoneNumber.value = phoneNumber;
                    },
                    initialCountryCode: 'IN',
                  ),

                  const SizedBox(height: 16),
                  const Text(
                    'Fliq will send you a text with a verification code.',
                    style: TextStyle(
                      fontSize: 14,
                      color: PhoneAuthColors.textSecondary,
                    ),
                  ),
                  const Spacer(),

                  // Action Button to proceed
                  Obx(
                    () => ActionButton(
                      label: 'Next',
                      isLoading: controller.isLoading.value,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.verifyPhoneNumber();
                          showTopSnackBar(
                            context,
                            'OTP has been sent to your registered phone number OTP:111111.', 
                          );
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
