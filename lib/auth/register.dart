import 'package:flutter/material.dart';
import 'package:wajibika_app/utils/globals.dart' as globals;
import 'package:wajibika_app/widgets/image.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return globals.registerLoginLayout(
      const Center(
        child: Column(
          children: [
            //logo
            ImageWidget(height: globals.logoheight, width: globals.logowidth, assetName: globals.logo),
            Form(
              
              child: Column(
            //username
            
            //email
            
            //password

            //confirm password

            //register btn

            //already registered? Login
            ))
          ],
        ),
      )
    );
  }
}