import 'package:flutter/material.dart';
import 'package:wajibika_app/utils/globals.dart' as globals;

class LoginRegisterButtonWidget extends StatelessWidget {
  final VoidCallback clickAction;
  final String buttonText;
  final Color btnColor;

  const LoginRegisterButtonWidget(
      {super.key,
      required this.clickAction,
      required this.btnColor,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: globals.buttonHeight,
      width: globals.buttonWidth,
      child: ElevatedButton(
        onPressed: clickAction,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(color: globals.buttonTextColor),
        ),
      ),
    );
  }
}
