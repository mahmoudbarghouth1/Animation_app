import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/util/image.dart';
import 'package:sign/view/screens/signup_screen.dart';
import 'package:sign/core/widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController;
    _paswordController;
  }

  Future signIn() async {
    _formkey.currentState!.validate();

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _paswordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
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
                  SizedBox(height: 20),
                  //title text
                  Text("msg1".tr(context), style: appTheme.textTheme.bodyLarge),
                  //sub title text
                  Text(
                    "msg2".tr(context),
                    style: appTheme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 15),
                  //email text field
                  Container(
                    decoration: BoxDecoration(
                      color: secondryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
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
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextFieldWidget(
                        controller: _paswordController,
                        hintText: "msg4".tr(context),
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondryColor,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      onPressed: () {
                        signIn();
                      },

                      child: Text(
                        "msg5".tr(context),
                        style: appTheme.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //signin button
                  Text("msg6".tr(context), style: appTheme.textTheme.bodySmall),
                  SizedBox(height: 15),
                  //sinup text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "msg7".tr(context),
                        style: appTheme.textTheme.bodySmall,
                      ),
                      SizedBox(width: 10),
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
    );
  }
}
