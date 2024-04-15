import 'package:flutter/material.dart';

class CustomTextbox extends StatelessWidget {
  const CustomTextbox(
      {this.hint = '',
      this.minLine,
      this.maxLines,
      this.keyboardType,
      this.controller,
      this.suffixIcon,
      super.key});
  final String hint;
  final int? minLine;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      minLines: minLine,
      maxLines: maxLines,
      // expands: true,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.all(4),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54, width: 0.7),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
