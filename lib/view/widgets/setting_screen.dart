import 'package:flutter/material.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(),
      body: Center(
        child: Container(color: primaryColor, child: Text("msg15".tr(context))),
      ),
    );
  }
}
