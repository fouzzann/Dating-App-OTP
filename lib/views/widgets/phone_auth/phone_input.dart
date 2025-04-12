// widget file: phone_input_field.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

/// Phone number input field with validation and formatting
class PhoneInputField extends StatelessWidget {
  final Function(String) onChanged;
  final String initialCountryCode;

  const PhoneInputField({
    super.key,
    required this.onChanged,
    this.initialCountryCode = 'IN',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: PhoneAuthColors.borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IntlPhoneField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Phone Number',
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        initialCountryCode: initialCountryCode,
        showDropdownIcon: true,
        dropdownIconPosition: IconPosition.trailing,
        flagsButtonPadding: const EdgeInsets.only(left: 10),
        disableLengthCheck: true,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        onChanged: (phone) {
          if (phone.number.length <= 10) {
            onChanged(phone.completeNumber);
          }
        },
        validator: (value) {
          if (value == null || value.number.isEmpty) {
            return 'Please enter phone number';
          } else if (!RegExp(r'^\d{10}$').hasMatch(value.number)) {
            return 'Enter valid 10-digit number';
          }
          return null;
        },
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
      ),
    );
  }
}
