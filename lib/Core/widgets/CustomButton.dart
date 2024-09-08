// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width; // Add width parameter
  Color TextColor;
  Color buttonColor;

  final double height; // Add height parameter
  CustomButton({
    this.TextColor = Colors.white,
    this.buttonColor = Colors.blue,
    required this.text,
    required this.height,
    required this.onPressed,
    this.width = double.infinity, // Default to full width
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width, // Use the passed width value
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33),
          ),
        ),
        child: Text(text, style: TextStyle(fontSize: 16, color: TextColor)),
      ),
    );
  }
}
