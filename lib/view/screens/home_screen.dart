import 'package:flutter/material.dart';
import 'package:login_signup/view/screens/auth_service.dart';
import 'package:login_signup/view/screens/loginscreen.dart';
import 'package:login_signup/widgets/auth/AuthButton.dart';
import 'package:login_signup/widgets/auth/TopAuthpage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Topauthpage(),
            const SizedBox(height: 20),
            AuthButton(
              label: "Sign Out",
              onPressed: () async {
                await auth.signout();
                goToLogin(context);
              },
            )
          ],
        ),
      ),
    );
  }

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Loginscreen()),
      );
}
