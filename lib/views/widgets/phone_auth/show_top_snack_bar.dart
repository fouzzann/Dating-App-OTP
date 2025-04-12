// views/widgets/phone_auth/top_snackbar.dart

import 'package:flutter/material.dart';
import 'package:lilac_infotech_task_otp/views/widgets/phone_auth/slider_transion.dart';

/// Displays a top snackbar with slide animation
void showTopSnackBar(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 20,
      right: 20,
      child: SlideTransitionWidget(
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[800],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Auto remove after 2 seconds
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
