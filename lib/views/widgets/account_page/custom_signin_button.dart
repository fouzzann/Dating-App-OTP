import 'package:flutter/material.dart';

class CustomSignInButton extends StatelessWidget {
  final String text;
  final bool useIcon;
  final IconData? iconData;
  final String? assetImage;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final double borderRadius;

  const CustomSignInButton({
    Key? key,
    required this.text,
    this.useIcon = false,
    this.iconData,
    this.assetImage,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (useIcon)
              assetImage != null
                  ? Image.asset(assetImage!, height: 24, width: 24)
                  : iconData != null
                      ? Icon(iconData, size: 24, color: textColor)
                      : const SizedBox(),
            if (useIcon) const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
