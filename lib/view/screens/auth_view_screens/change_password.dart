import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/util/snake_bar_message.dart';
import 'package:sign/core/global%20widgets/gradiant_scaffold.dart';
import 'package:sign/core/global%20widgets/text_field_widget.dart';
import 'package:sign/viewmodel/providers.dart';

class ChangePassword extends ConsumerStatefulWidget {
  const ChangePassword({super.key});

  @override
  ConsumerState<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePassword> {
  final _email = TextEditingController();
  final _oldPassword = TextEditingController();
  final _newPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientScaffold(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  "please enterr your email to sent you a rest password ",
                  style: appTheme.textTheme.bodyMedium,
                ),
                SizedBox(height: 70.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(12.r),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFieldWidget(
                      keyboard: TextInputType.emailAddress,
                      controller: _email,
                      hintText: "Email",
                      obscureText: false,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(12.r),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFieldWidget(
                      keyboard: TextInputType.emailAddress,
                      controller: _oldPassword,
                      hintText: "Old password",
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.circular(12.r),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFieldWidget(
                      keyboard: TextInputType.emailAddress,
                      controller: _newPassword,
                      hintText: "New Password",
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final userviewmodle = ref.read(
                        authViewerModelProvider.notifier,
                      );
                      bool success = await ref
                          .read(authViewerModelProvider.notifier)
                          .changePassword(
                            _email.text.trim(),
                            _oldPassword.text.trim(),
                            _newPassword.text.trim(),
                          );
                      if (success) {
                        SnakeBarMessageWidget().showSuccessSnakeBar(
                          message: "Pasword changed successfully",
                          context: context,
                        );
                        Navigator.pop(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (_) => LoginScreen()),
                        // );
                      } else {
                        SnakeBarMessageWidget().showFailureSnakeBar(
                          message: userviewmodle.changeErrorMessage!,
                          // "failed to load",
                          context: context,
                        );
                      }
                    },

                    child: Text(
                      "Change password Password ",
                      style: appTheme.textTheme.bodyMedium,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Back", style: appTheme.textTheme.bodyMedium),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
