import 'package:cce_app/Core/manager/ColorsManager.dart';
import 'package:cce_app/Core/manager/FontsManger.dart';
import 'package:flutter/material.dart';

class CustomLabelHintText extends StatelessWidget {
  final String labelText;
  final bool showAsterisk;

  const CustomLabelHintText({
    super.key,
    required this.labelText,
    this.showAsterisk = false, // Default to not show asterisk
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: labelText, // The main label text
        style: TextStyle(
          fontFamily: Fontsmanger.AbhayaLibreMeduiem,

          color: ColorsManager.coustomLabelTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 16, // You can adjust the font size
        ),
        children: [
          if (showAsterisk)
            const TextSpan(
              text: ' *', // The red asterisk
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}
