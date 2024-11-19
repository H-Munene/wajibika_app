import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback clickAction;

  const TextButtonWidget(
      {super.key, required this.btnText, required this.clickAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextButton(
          onPressed: clickAction,
          style: TextButton.styleFrom(overlayColor: Colors.transparent,),//remove overlay effect
          child: Text(
            btnText,
            style: const TextStyle(color: Colors.blue,decoration: TextDecoration.underline),
          )),
    );
  }
}
