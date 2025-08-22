import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/util/snake_bar_message.dart';
import 'package:sign/core/widgets/gradiant_scaffold.dart';
import 'package:sign/core/widgets/text_field_widget.dart';
import 'package:sign/view/screens/auth_view_screens/login_screen.dart';
import 'package:sign/viewmodel/providers.dart';

class RessetPassword extends ConsumerStatefulWidget {
  const RessetPassword({super.key});

  @override
  ConsumerState<RessetPassword> createState() => _RessetPasswordState();
}

class _RessetPasswordState extends ConsumerState<RessetPassword> {
  final _email = TextEditingController();

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
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(12.r),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFieldWidget(
                      keyboard: TextInputType.emailAddress,
                      controller: _email,
                      hintText: "email",
                      obscureText: false,
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
                          .resetPassword(_email.text.trim());
                      if (success) {
                        SnakeBarMessageWidget().showSuccessSnakeBar(
                          message: "Mail Send Succefully",
                          context: context,
                        );
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      } else {
                        SnakeBarMessageWidget().showFailureSnakeBar(
                          message: userviewmodle.resetErrorMessage!,
                          // "failed to load",
                          context: context,
                        );
                      }
                    },

                    child: Text(
                      "Reset Password ",
                      style: appTheme.textTheme.bodyMedium,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
