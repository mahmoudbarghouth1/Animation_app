import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/util/image.dart';
import 'package:sign/core/util/snake_bar_message.dart';
import 'package:sign/core/global%20widgets/gradiant_scaffold.dart';
import 'package:sign/view/screens/auth_view_screens/resset_password.dart';
import 'package:sign/view/screens/auth_view_screens/signup_screen.dart';
import 'package:sign/core/global%20widgets/text_field_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/view/screens/home_screen.dart';
import 'package:sign/viewmodel/providers.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();

  @override
  void dispose() {
    _emailController;
    _paswordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientScaffold(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //image
                    AppImage(),
                    SizedBox(height: 20.h),
                    //title text
                    Text(
                      "msg1".tr(context),
                      style: appTheme.textTheme.bodyLarge,
                    ),
                    //sub title text
                    Text(
                      "msg2".tr(context),
                      style: appTheme.textTheme.bodyMedium,
                    ),
                    SizedBox(height: 15.h),
                    //email text field
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      // child: Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextFieldWidget(
                        keyboard: TextInputType.emailAddress,
                        controller: _emailController,
                        hintText: "msg3".tr(context),
                        obscureText: false,
                      ),
                    ),
                    // ),
                    SizedBox(height: 10.h),
                    //pasword textfield
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(12.r),
                      ),

                      // padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextFieldWidget(
                        keyboard: TextInputType.numberWithOptions(),
                        controller: _paswordController,
                        hintText: "msg4".tr(context),
                        obscureText: true,
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
                              .signIn(
                                _emailController.text.trim(),
                                _paswordController.text.trim(),
                              );
                          if (success) {
                            SnakeBarMessageWidget().showSuccessSnakeBar(
                              message: "msg20".tr(context),
                              context: context,
                            );
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => HomeScreen()),
                            );
                          } else {
                            SnakeBarMessageWidget().showFailureSnakeBar(
                              message: userviewmodle.sininErrorMessage!,
                              // "failed to load",
                              context: context,
                            );
                          }
                        },

                        child: Text(
                          "msg5".tr(context),
                          style: appTheme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    //signin button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => RessetPassword()),
                        );
                      },
                      child: Text(
                        "msg6".tr(context),
                        style: appTheme.textTheme.bodySmall,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    //sinup text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "msg7".tr(context),
                          style: appTheme.textTheme.bodySmall,
                        ),
                        SizedBox(width: 10.w),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(builder: (_) => SignupScreen()),
                            );
                          },
                          child: Text(
                            "msg8".tr(context),
                            style: appTheme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
