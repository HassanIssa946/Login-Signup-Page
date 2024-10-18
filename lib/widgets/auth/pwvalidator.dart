// password_validator.dart
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class PasswordValidatorWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function() onSuccess;
  final Function() onFail;

  PasswordValidatorWidget({
    required this.controller,
    required this.onSuccess,
    required this.onFail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FlutterPwValidator(
        controller: controller,
        minLength: 6,
        uppercaseCharCount: 1,
        numericCharCount: 1,
        specialCharCount: 1,
        width: 300,
        height: 100,
        onSuccess: onSuccess,
        onFail: onFail,
      ),
    );
  }
}
