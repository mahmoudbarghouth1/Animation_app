import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController;
    _paswordController;
  }

  Future signIn() async {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //image
                AppImage(),
                SizedBox(height: 20),
                //title text
                Text("Welcome Back", style: appTheme.textTheme.bodyLarge),
                //sub title text
                Text(
                  "Sign in to continue your anime journey",
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
                      hintText: "Email",
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
                      hintText: "Password",
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
                    onPressed: //_paswordController.text.isNotEmpty&&_emailController.text.isNotEmpty?
                    () {
                      signIn();
                    },
                    //: null,
                    child: Text(
                      "Sign In",
                      style: appTheme.textTheme.bodyMedium,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                //signin button
                Text("Forget password", style: appTheme.textTheme.bodySmall),
                SizedBox(height: 15),
                //sinup text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account",
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
                        "Sign up ",
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
