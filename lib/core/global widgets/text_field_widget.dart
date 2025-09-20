import 'package:flutter/material.dart';
import 'package:sign/core/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboard,
    this.onChanged=_emptyFunction,
  });
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboard;
  final Function(String) onChanged;
  static void _emptyFunction(String _) {}

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
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: appTheme.textTheme.bodySmall,
      ),
    );
  }
}
