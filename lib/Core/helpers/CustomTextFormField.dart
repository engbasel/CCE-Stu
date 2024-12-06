import 'package:flutter/material.dart';

// CustomTextFormField Widget to reuse across the app
// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final bool isPasswordField;
  final bool isPasswordVisible;
  final Function()? onSuffixIconPressed;
  final TextEditingController? controller;

  String? Function(String?)? validator;
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    this.isPasswordField = false,
    this.isPasswordVisible = false,
    this.onSuffixIconPressed,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isPasswordField && !isPasswordVisible,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        suffixIcon: isPasswordField
            ? IconButton(
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: onSuffixIconPressed,
              )
            : null,
      ),
    );
  }
}
