import 'package:flutter/material.dart';
import 'package:sign/core/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "in vaild input";
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
