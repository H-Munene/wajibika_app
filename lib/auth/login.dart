import 'package:flutter/material.dart';
import 'package:wajibika_app/utils/globals.dart' as globals;
import 'package:wajibika_app/widgets/image.dart';

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
      child: Center(
        child: Column(
          children: [
            //add image

            //add titles
            ImageWidget(
                height: globals.logoheight,
                width: globals.logowidth,
                assetName: globals.logo),
            //add textformfields
            
            //login button
          ],
        ),
      ),
    ));
  }
}
