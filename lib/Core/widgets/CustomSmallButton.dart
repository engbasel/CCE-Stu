// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomSmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  Color textColor;
  Color buttonColor;
  final double height;

  CustomSmallButton({
    Key? key,
    this.textColor = Colors.white,
    this.buttonColor = Colors.blue,
    required this.text,
    required this.height,
    required this.onPressed,
    this.width = double.infinity, // Default to full width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width, // Use the passed width value
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                16), // Smaller border radius for a smaller look
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8), // Reduced padding for a more compact button
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14, // Smaller font size for a smaller button
            fontWeight: FontWeight.w500, // Slightly bolder text for visibility
            color: textColor,
          ),
        ),
      ),
    );
  }
}
