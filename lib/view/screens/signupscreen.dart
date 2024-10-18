import 'package:flutter/material.dart';
import 'package:login_signup/core/constants/colors.dart';
import 'package:login_signup/view/screens/auth_service.dart';
import 'package:login_signup/view/screens/home_screen.dart';
import 'package:login_signup/widgets/auth/AuthButton.dart';
import 'package:login_signup/widgets/auth/TextField.dart';
import 'package:login_signup/widgets/auth/TopAuthpage.dart';
import 'package:login_signup/widgets/auth/pwvalidator.dart';
import 'package:login_signup/widgets/auth/switchpage.dart';
import 'package:show_hide_password/show_hide_password_text_field.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();
  bool _isPasswordValid = false;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        // Add SafeArea
        child: SingleChildScrollView(
          // Add SingleChildScrollView
          child: Column(
            children: [
              const Topauthpage(),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      MyTextField(
                        hintText: 'XXXX@X.com',
                        labelText: 'Email',
                        textEditingController: _email,
                        suffixIcon: Icons.email_outlined,
                      ),
                      const SizedBox(height: 10),
                      ShowHidePasswordTextField(
                        controller: _password,
                        decoration: InputDecoration(
                          suffixIconColor: secondaryColor,
                          hintText: "password",
                          hintStyle: const TextStyle(color: primaryColor),
                          label: Container(
                            margin: const EdgeInsets.all(8),
                            child: const Text("password"),
                          ),
                          labelStyle: const TextStyle(color: secondaryColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        iconSize: 20,
                        visibleOffIcon: Icons.remove_red_eye_outlined,
                        visibleOnIcon: Icons.remove_red_eye_sharp,
                      ),
                      const SizedBox(height: 10),
                      ShowHidePasswordTextField(
                        controller: _confirmPassword,
                        decoration: InputDecoration(
                          suffixIconColor: secondaryColor,
                          hintText: "Confirm password",
                          hintStyle: const TextStyle(color: primaryColor),
                          label: Container(
                            margin: const EdgeInsets.all(8),
                            child: const Text("confirm password"),
                          ),
                          labelStyle: const TextStyle(color: secondaryColor),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        iconSize: 20,
                        visibleOffIcon: Icons.remove_red_eye_outlined,
                        visibleOnIcon: Icons.remove_red_eye_sharp,
                      ),
                      PasswordValidatorWidget(
                        controller: _password,
                        onSuccess: () {
                          setState(() {
                            _isPasswordValid = true;
                          });
                        },
                        onFail: () {
                          setState(() {
                            _isPasswordValid = false;
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      AuthButton(
                        label: 'Sign Up',
                        onPressed: _signup,
                      ),
                      const SizedBox(height: 20),
                      switchbutton(
                        textbutton: 'log in',
                        textsentence: 'already have an account !! ',
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
  _signup() async {
    final user =
        await auth.createUserWithEmailAndPassword(_email.text, _password.text);
    if (user != null) {
      print("User Registered");
      goToHome(context);
    }
  }
}
