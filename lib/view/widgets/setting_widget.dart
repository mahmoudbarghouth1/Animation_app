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
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.amber,
              // backgroundImage: ,
            ),
            const SizedBox(height: 10),
            const Text("Anime explorer"),
            const SizedBox(height: 10),
            const Text("memser since 2024"),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg29".tr(context),
                    style: appTheme.textTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      Text(
                        "msg30".tr(context),
                        style: appTheme.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("msg31".tr(context)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("msg32".tr(context)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg33".tr(context),
                    style: appTheme.textTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      Text(
                        "msg34".tr(context),
                        style: appTheme.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("msg37".tr(context)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("msg38".tr(context)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "msg39".tr(context),
                    style: appTheme.textTheme.bodySmall,
                  ),
                  Row(
                    children: [
                      Text(
                        "msg40".tr(context),
                        style: appTheme.textTheme.bodyMedium,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("msg42".tr(context)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black, thickness: .5, height: 10),
                  Row(
                    children: [
                      Text("msg43".tr(context)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

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
                child: Text(
                  "msg44".tr(context),
                  style: appTheme.textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
