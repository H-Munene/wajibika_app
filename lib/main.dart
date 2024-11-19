import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wajibika_app/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wajibika' ,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,  
      ),
    
      home: const LoginPage(),
    );
  }
}
