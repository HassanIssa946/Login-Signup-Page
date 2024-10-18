import 'package:flutter/material.dart';
import 'package:login_signup/core/constants/colors.dart';

class switchbutton extends StatelessWidget {
  String textbutton;
  String textsentence;
  Function()? onPressed;
  switchbutton({
    Key? key,
    required this.textbutton,
    required this.textsentence,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 10,
        left: 10,
        child: Row(
          children: [
            Text(
              textsentence,
              style: const TextStyle(color: primaryColor, fontSize: 18),
            ),
            InkWell(
              onTap: onPressed,
              child: Text(
                textbutton,
                style: TextStyle(
                    color: secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )
          ],
        ));
  }
}
