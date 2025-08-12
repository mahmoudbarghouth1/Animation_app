import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 43, 147),
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: const Color.fromRGBO(55, 88, 237, 1),
          child: Text("Top anime "),
        ),
      ),
    );
  }
}
