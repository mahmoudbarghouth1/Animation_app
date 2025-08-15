import 'package:flutter/material.dart';
import 'package:sign/core/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboard,
  });
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "invalid input";
        }
        return null;
      },
      style: appTheme.textTheme.bodySmall,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: appTheme.textTheme.bodySmall,
      ),
    );
  }
}
