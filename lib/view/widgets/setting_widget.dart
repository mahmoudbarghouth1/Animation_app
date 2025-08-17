import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/util/snake_bar_message.dart';
import 'package:sign/view/screens/auth_view_screens/login_screen.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 40),

        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.amber,
              // backgroundImage: ,
            ),
            SizedBox(height: 10),
            Text("Anime explorer"),
            SizedBox(height: 10),
            Text("memser since 2024"),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: secondryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Account", style: appTheme.textTheme.bodySmall),
                  Row(
                    children: [
                      Text(
                        "Edite profile",
                        style: appTheme.textTheme.bodyMedium,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("changing password"),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("privacy settings"),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: secondryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Preferance", style: appTheme.textTheme.bodySmall),
                  Row(
                    children: [
                      Text("Dark mode", style: appTheme.textTheme.bodyMedium),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("Notifications"),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("Auto-playTrails"),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: secondryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Support", style: appTheme.textTheme.bodySmall),
                  Row(
                    children: [
                      Text("Help center", style: appTheme.textTheme.bodyMedium),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("Report a Bug"),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("Rate App"),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginScreen()),
                  );
                  SnakeBarMessageWidget().showSuccessSnakeBar(
                    message: "msg19".tr(context),
                    context: context,
                  );
                },
                child: Text("sign out", style: appTheme.textTheme.bodyMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
