import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/widgets/loadin_view.dart';
import 'package:sign/view/screens/auth_view_screens/login_screen.dart';
import 'package:sign/view/screens/home_screen.dart';

class Auth extends ConsumerWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final data = ref.watch(authorizationProvider);

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return FutureBuilder(
              future: Future.delayed(Duration(seconds: 2)),
              builder: (context, _) {
                return LoadingView();
              },
            );
          } else {
            if (snapshot.hasData) {
              return HomeScreen();
            } else {
              return LoginScreen();
            }
          }
        }),
      ),
    );
  }
}
