import 'package:flutter/material.dart';
import 'package:sign/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sign/core/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const Auth(),
    );
  }
}
