import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/util/image.dart';
import 'package:sign/core/util/snake_bar_message.dart';
import 'package:sign/core/global%20widgets/checkbox_form_field.dart';
import 'package:sign/view/screens/auth_view_screens/login_screen.dart';
import 'package:sign/core/global%20widgets/text_field_widget.dart';
import 'package:sign/viewmodel/providers.dart';
import 'package:sign/core/global%20widgets/gradiant_scaffold.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});
  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();
  final _confirmPaswordController = TextEditingController();
  final _usernamecontroller = TextEditingController();
  bool checkboxValue = false;
  bool isConnected = false;
  @override
  void dispose() {
    _emailController;
    _paswordController;
    _confirmPaswordController;
    _usernamecontroller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  GradientScaffold _body(BuildContext context) {
    return GradientScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  //image
                  const AppImage(),
                  SizedBox(height: 20.h),
                  //title text
                  Text("msg9".tr(context), style: appTheme.textTheme.bodyLarge),
                  //sub title text
                  Text(
                    "msg10".tr(context),
                    style: appTheme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 15.h),
                  //email text field
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(12.r),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldWidget(
                        keyboard: TextInputType.emailAddress,
                        controller: _usernamecontroller,
                        hintText: "msg11".tr(context),
                        obscureText: false,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: TextFieldWidget(
                        keyboard: TextInputType.emailAddress,
                        controller: _emailController,
                        hintText: "msg3".tr(context),
                        obscureText: false,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //pasword textfield
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFieldWidget(
                        keyboard: TextInputType.numberWithOptions(),
                        controller: _paswordController,
                        hintText: "msg4".tr(context),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: TextFieldWidget(
                        keyboard: TextInputType.numberWithOptions(),
                        controller: _confirmPaswordController,
                        hintText: "msg12".tr(context),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  //terms of policy
                  CheckboxFormField(
                    title: "msg13".tr(context),
                    onSaved: (value) => checkboxValue = value ?? false,
                    validator: (value) {
                      if (value != true) {
                        return "msg21".tr(context);
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  //signin button
                  ElevatedButton(
                    onPressed: () async {
                      final userViewModel = ref.read(
                        authViewerModelProvider.notifier,
                      );
                      _formkey.currentState!.validate();

                      bool success = await ref
                          .read(authViewerModelProvider.notifier)
                          .signUp(
                            _emailController.text.trim(),
                            _confirmPaswordController.text.trim(),
                          );
                      if (success &&
                          _paswordController.text.trim() ==
                              _confirmPaswordController.text.trim()) {
                        SnakeBarMessageWidget().showSuccessSnakeBar(
                          message: "msg22".tr(context),
                          context: context,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginScreen()),
                        );
                      } else {
                        SnakeBarMessageWidget().showFailureSnakeBar(
                          message:
                              userViewModel.sinupErroreMessage ??
                              "msg23".tr(context),
                          context: context,
                        );
                      }
                    },
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(12.r),
                        child: Text(
                          "msg9".tr(context),
                          style: appTheme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  //sinup text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "msg14".tr(context),
                        style: appTheme.textTheme.bodySmall,
                      ),
                      SizedBox(width: 10.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => LoginScreen()),
                          );
                        },
                        child: Text(
                          "msg5".tr(context),
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
    );
  }
}
