import 'package:flutter/material.dart';
import 'package:login_signup/core/constants/colors.dart';

class Topauthpage extends StatelessWidget {
  const Topauthpage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset('assets/img/1.jpg', height: 250),
        ),
        const Text(
          "Welcome to my Application",
          style: TextStyle(fontSize: 30, color: primaryColor),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
