import 'package:flutter/material.dart';
import 'package:wajibika_app/utils/globals.dart' as globals;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return globals.registerLoginLayout(const Padding(
      padding: globals.LRPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //add image

          //add titles

          //add textformfields
          
          //login button
        ],
      ),
    ));
  }
}
