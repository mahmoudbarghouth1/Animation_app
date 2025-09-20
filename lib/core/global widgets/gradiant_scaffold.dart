import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff162859),
            Color.fromARGB(255, 4, 51, 180),
            Color.fromARGB(255, 41, 88, 218),
          ],
        ),
      ),
      child: child,
    );
  }
}
