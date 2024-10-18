import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/core/constants/colors.dart';
import 'package:login_signup/view/screens/auth_service.dart';
import 'package:login_signup/view/screens/home_screen.dart';
import 'package:login_signup/widgets/auth/AuthButton.dart';
import 'package:login_signup/widgets/auth/Forgetpassword.dart';
import 'package:login_signup/widgets/auth/TextField.dart';
import 'package:login_signup/widgets/auth/TopAuthpage.dart';
import 'package:login_signup/widgets/auth/switchpage.dart';
import 'package:show_hide_password/show_hide_password_text_field.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();
  String resetMessage = '';

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const Topauthpage(),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Form(
                            child: Column(
                          children: [
                            MyTextField(
                              hintText: 'XXXX@X.com',
                              labelText: 'Email',
                              suffixIcon: Icons.email,
                              textEditingController: _email,
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
                                labelStyle:
                                    const TextStyle(color: secondaryColor),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              iconSize: 20,
                              visibleOffIcon: Icons.remove_red_eye_outlined,
                              visibleOnIcon: Icons.remove_red_eye_sharp,
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                                onPressed: () {
                                  forgetpassword();
                                },
                                child: Text(
                                  "forget password",
                                  style: TextStyle(color: primaryColor),
                                )),
                            const SizedBox(height: 10),
                            AuthButton(
                              label: 'Log in',
                              onPressed: _login,
                            ),
                            const SizedBox(height: 20),
                            switchbutton(
                              textbutton: 'sign up',
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              textsentence: 'dont have an account !! ',
                            ),
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
  _login() async {
    final user =
        await auth.loginUserWithEmailAndPassword(_email.text, _password.text);
    if (user != null) {
      print("User Logged In");
      goToHome(context);
    }
  }

  Future<void> forgetpassword() async {
    if (_email.text.isEmpty) {
      // Show a SnackBar if the email field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your email.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _email.text.trim());

      // Show a success message using SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Follow the link sent to your email.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Show an error message using SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red[400],
        ),
      );
    }
  }
}
