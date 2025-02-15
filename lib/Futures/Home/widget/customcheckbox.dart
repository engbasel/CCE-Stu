import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool? isChecked;
  final ValueChanged<bool?> ?onChanged;
  final VoidCallback? onChecked;

  const CustomCheckbox({super.key, this.isChecked,  this.onChanged, this.onChecked}); // Callback function to run when checked


  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.isChecked,
      onChanged: (value) {
        widget.onChanged!(value);

        // Only run the passed function if the checkbox is checked
        if (value == true) {
          widget.onChecked!();
        }
      },
      shape: RoundedRectangleBorder(

        borderRadius: BorderRadius.circular(5), // Slightly rounded square
      ),
      side: const BorderSide(
        color: Color(0xFF073C47), // Dark border color (matches design)
        width: 1, // Border width
      ),
      activeColor: Colors.transparent, // Removes fill color
      checkColor: const Color(0xFF073C47), // Color of the checkmark
    );
  }
}
