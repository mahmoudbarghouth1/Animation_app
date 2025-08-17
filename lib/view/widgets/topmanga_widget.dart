import 'package:flutter/material.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';

class TopMangaWidget extends StatelessWidget {
  const TopMangaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(),
      body: Center(
        child: Container(color: primaryColor, child: Text("top manga widget")),
      ),
    );
  }
}
