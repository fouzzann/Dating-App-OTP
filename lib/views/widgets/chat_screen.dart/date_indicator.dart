// widget file: date_indicator.dart
import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/utils/app_colors.dart';

/// Widget that shows the date indicator (e.g., "Today") above messages
class DateIndicator extends StatelessWidget {
  const DateIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: ChatColors.dateIndicatorBackground,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            'Today',
            style: TextStyle(
              color: ChatColors.dateIndicatorText,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
