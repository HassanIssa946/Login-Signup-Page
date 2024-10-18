import 'package:flutter/material.dart';
import 'package:login_signup/core/constants/colors.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData suffixIcon;
  final TextEditingController textEditingController;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.suffixIcon,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        suffixIcon: Icon(suffixIcon),
        suffixIconColor: Colors.grey,
        hintText: hintText,
        hintStyle: const TextStyle(color: primaryColor),
        label: Container(
          margin: const EdgeInsets.all(8),
          child: Text(labelText),
        ),
        labelStyle: const TextStyle(color: secondaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
