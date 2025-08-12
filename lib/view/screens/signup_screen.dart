import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign/auth.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/util/image.dart';
import 'package:sign/view/screens/login_screen.dart';
import 'package:sign/core/widgets/text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();
  final _confirmPaswordController = TextEditingController();
  final _usernamecontroller = TextEditingController();
  bool isConnected = false;
  @override
  void dispose() {
    _emailController;
    _paswordController;
    super.dispose();
  }

  Future sinUp(context) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _paswordController.text.trim(),
    );
    if (_paswordController.text.trim() ==
        _confirmPaswordController.text.trim()) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Auth()));
    }
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
          child: Column(
            children: [
              //image
              AppImage(),
              SizedBox(height: 20),
              //title text
              Text("Create A ccount", style: appTheme.textTheme.bodyLarge),
              //sub title text
              Text(
                "Welcome  Nice To see You  ",
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),

                  child: TextFieldWidget(
                    controller: _usernamecontroller,
                    hintText: "Username",
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFieldWidget(
                    controller: _paswordController,
                    hintText: "Password",
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
                    hintText: "Confirm Password",
                    obscureText: true,
                  ),
                ),
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                value: isConnected,
                onChanged: (bool? value) {
                  setState(() {
                    isConnected = value!;
                  });
                },
                title: Text(
                  "I agree to the terms of policy ",
                  textAlign: TextAlign.left,
                  style: appTheme.textTheme.bodyMedium,
                ),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                dense: true,
              ),
              SizedBox(height: 10),
              //signin button
              GestureDetector(
                onTap: () {
                  sinUp(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: secondryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "Create Account",
                        style: appTheme.textTheme.bodyMedium,
                      ),
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
                    " Already have an account",
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
                      "Sign In ",
                      style: appTheme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
