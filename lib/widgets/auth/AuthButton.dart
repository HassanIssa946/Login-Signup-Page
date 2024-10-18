import 'package:flutter/material.dart';
import 'package:login_signup/core/constants/colors.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const AuthButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(primaryColor),
              fixedSize: WidgetStateProperty.all(Size(double.maxFinite, 50))),
          child: Text(
            label,
            style: TextStyle(color: secondaryColor, fontSize: 18),
          )),
    );
  }
}
