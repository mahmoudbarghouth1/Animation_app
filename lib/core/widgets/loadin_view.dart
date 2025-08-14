import 'package:flutter/material.dart';
import 'package:sign/core/app_theme.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(color: secondryColor),
          ),
        ),
      ),
    );
  }
}
