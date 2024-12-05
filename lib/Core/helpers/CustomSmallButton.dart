import 'package:flutter/material.dart';

class CustomSmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final Color textColor;
  final Color buttonColor;
  final double height;
  final Icon? icon; // Optional icon for the button

  CustomSmallButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width = double.infinity, // Default to full width
    this.textColor = Colors.white,
    this.buttonColor = Colors.blue,
    required this.height,
    this.icon, // Optional icon parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Smaller border radius
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 8), // Compact padding
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!, // Display icon if provided
              const SizedBox(width: 8), // Space between icon and text
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: 14, // Slightly smaller font for a compact button
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
