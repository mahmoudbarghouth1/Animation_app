// import 'dart:developer' show log;

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign/core/app_localizations.dart';

import 'package:sign/core/app_theme.dart';
import 'package:sign/core/util/image.dart';
import 'package:sign/core/util/snake_bar_message.dart';
import 'package:sign/view/auth.dart';
import 'package:sign/view/screens/login_screen.dart';
import 'package:sign/core/widgets/text_field_widget.dart';
import 'package:sign/viewmodel/auth_view_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthViewModel viewModel = AuthViewModel();
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();
  final _confirmPaswordController = TextEditingController();
  final _usernamecontroller = TextEditingController();

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
    return Scaffold(backgroundColor: primaryColor, body: _body(context));
  }

  SafeArea _body(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                //image
                AppImage(),
                SizedBox(height: 20),
                //title text
                Text("msg9".tr(context), style: appTheme.textTheme.bodyLarge),
                //sub title text
                Text("msg10".tr(context), style: appTheme.textTheme.bodyMedium),
                SizedBox(height: 15),
                //email text field
                Container(
                  decoration: BoxDecoration(
                    color: secondryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),

                    child: TextFieldWidget(
                      controller: _usernamecontroller,
                      hintText: "msg11".tr(context),
                      obscureText: false,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: secondryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFieldWidget(
                      controller: _emailController,
                      hintText: "msg3".tr(context),
                      obscureText: false,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //pasword textfield
                Container(
                  decoration: BoxDecoration(
                    color: secondryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFieldWidget(
                      controller: _paswordController,
                      hintText: "msg4".tr(context),
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: secondryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFieldWidget(
                      controller: _confirmPaswordController,
                      hintText: "msg12".tr(context),
                      obscureText: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //terms of policy
                CheckboxListTile(
                  value: isConnected,
                  onChanged: (bool? value) {
                    setState(() {
                      isConnected = value!;
                      _formkey.currentState!.validate();
                    });
                  },
                  title: Text(
                    "msg13".tr(context),
                    textAlign: TextAlign.left,
                    style: appTheme.textTheme.bodyMedium,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
                SizedBox(height: 10),
                //signin button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondryColor,
                  ),

                  onPressed: () async {
                    bool success = await viewModel.signUp(
                      _emailController.text.trim(),
                      _confirmPaswordController.text.trim(),
                    );
                    if (success &&
                        _emailController.text.trim() ==
                            _confirmPaswordController.text.trim()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Auth()),
                      );
                    } else {
                      SnakeBarMessageWidget().showFailureSnakeBar(
                        message: viewModel.sinupErroreMessage!,
                        context: context,
                      );
                    }
                  },

                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "msg9".tr(context),
                        style: appTheme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                //sinup text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "msg14".tr(context),
                      style: appTheme.textTheme.bodySmall,
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
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
    );
  }
}
