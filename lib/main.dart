import 'package:Wajibika/pages/navigation.dart';
import 'package:Wajibika/pages/splashscreen.dart';
import 'package:Wajibika/pages/statedepts/all_depts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Wajibika/auth/login.dart';
import 'package:Wajibika/auth/register.dart';
import 'package:Wajibika/pages/home.dart';

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
      title: 'Wajibika',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        '/splashscreen': (context) => const SplashScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/basepage' : (context) => const BasePage(),
        '/mda-projects':  (context) => const AllStateDepts(),

      },
    );
  }
}
