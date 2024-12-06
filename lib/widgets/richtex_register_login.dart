import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextRegisterLogin extends StatelessWidget {
  final String redirect;
  final String alreadyLoginOrRgister;
  final String loginOrRegister;

  const RichTextRegisterLogin(
      {super.key,
      required this.alreadyLoginOrRgister,
      required this.loginOrRegister,
      required this.redirect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: RichText(
        text: TextSpan(
          text: alreadyLoginOrRgister,
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: loginOrRegister,
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  //navigate to login screen
                  Navigator.pushNamed(context, redirect);
                },
            ),
          ],
        ),
      ),
    );
  }
}
