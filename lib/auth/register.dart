import 'package:flutter/material.dart';
import 'package:wajibika_app/utils/globals.dart' as globals;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return globals.registerLoginLayout(
      Center(
        child: Column(
          children: [
            
          ],
        ),
      )
    );
  }
}