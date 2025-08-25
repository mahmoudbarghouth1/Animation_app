import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/util/snake_bar_message.dart';
import 'package:sign/view/screens/auth_view_screens/change_password.dart';
import 'package:sign/view/screens/auth_view_screens/login_screen.dart';
import 'package:sign/viewmodel/providers.dart';

// ignore: must_be_immutable
class SettingWidget extends ConsumerStatefulWidget {
  const SettingWidget({super.key});

  @override
  ConsumerState<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends ConsumerState<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 30.w),

        child: Column(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundColor: Colors.amber,
              // backgroundImage: ,
            ),
            SizedBox(height: 5.h),
            Text("Anime explorer", style: appTheme.textTheme.bodyMedium),
            SizedBox(height: 5.h),
            Text("memser since 2024", style: appTheme.textTheme.bodyMedium),
            SizedBox(height: 5.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: AppRadius.medium.r,
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
                  Divider(color: Colors.black, thickness: .1.h, height: 5.h),
                  Row(
                    children: [
                      Text(
                        "msg31".tr(context),
                        style: appTheme.textTheme.bodySmall,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ChangePassword()),
                          );
                        },
                        child: const Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .1.h, height: 5.h),
                  Row(
                    children: [
                      Text(
                        "msg32".tr(context),
                        style: appTheme.textTheme.bodySmall,
                      ),
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

            SizedBox(height: 5.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: AppRadius.medium,
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
                      Switch(
                        value: ref.watch(themeProvider) == ThemeMode.dark,
                        onChanged: (value) {
                          ref.read(themeProvider.notifier).state = value
                              ? ThemeMode.dark
                              : ThemeMode.system;
                        },
                      ),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .1.h, height: 1.h),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "msg45".tr(context),
                  //       style: appTheme.textTheme.bodySmall,
                  //     ),
                  //     const Spacer(),
                  //     Switch(
                  //       value: ref.watch(languageProvider) == Locale('ar'),
                  //       onChanged: (value) {
                  //         ref.read(languageProvider.notifier).state = value
                  //             ? Locale('ar')
                  //             : Locale('en');
                  //       },
                  //     ),
                  //   ],
                  // ),
                  Divider(color: Colors.black, thickness: .1.h, height: 1.h),
                  Row(
                    children: [
                      Text(
                        "msg45".tr(context),
                        style: appTheme.textTheme.bodySmall,
                      ),
                      const Spacer(),
                      DropdownButton<Locale>(
                        dropdownColor: AppColors.primary,
                        // iconEnabledColor: AppColors.secondary,
                        // focusColor: AppColors.secondary,
                        value: ref.watch(languageProvider),
                        items: [
                          DropdownMenuItem(
                            value: Locale('en'),
                            child: Text(
                              "english",
                              style: appTheme.textTheme.bodySmall,
                            ),
                          ),
                          DropdownMenuItem(
                            value: Locale('ar'),
                            child: Text(
                              "العربيه",
                              style: appTheme.textTheme.bodySmall,
                            ),
                          ),
                          DropdownMenuItem(
                            value: null,
                            child: Text(
                              "msg46".tr(context),
                              style: appTheme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          ref.watch(languageProvider.notifier).state = value;
                        },
                      ),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .1.h, height: 1.h),
                ],
              ),
            ),

            SizedBox(height: 5.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: AppRadius.medium,
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
                        "msg42".tr(context),
                        style: appTheme.textTheme.bodySmall,
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 3.h,
                        child: const Icon(Icons.arrow_right_alt_outlined),
                      ),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .1.h, height: 3.h),
                  Row(
                    children: [
                      Text(
                        "msg40".tr(context),
                        style: appTheme.textTheme.bodySmall,
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_right_alt_outlined),
                    ],
                  ),
                  Divider(color: Colors.black, thickness: .1.h, height: 5.h),
                  Row(
                    children: [
                      Text(
                        "msg43".tr(context),
                        style: appTheme.textTheme.bodySmall,
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_right_alt_outlined),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),
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
            // SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
