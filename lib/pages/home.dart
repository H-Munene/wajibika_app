import 'package:flutter/material.dart';
import 'package:Wajibika/utils/globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Image(
        image: AssetImage(globals.logo),
        width: globals.appBarLogoWidth,
      ),
      backgroundColor: globals.primaryColor,
      automaticallyImplyLeading: false,
    ),
    body: Text("HOME"),
    
  );
  }
}