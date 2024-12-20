import 'package:Wajibika/pages/bookmarks.dart';
import 'package:Wajibika/pages/citizen_audited/all_counties.dart';
import 'package:Wajibika/pages/base_page.dart';
import 'package:Wajibika/pages/splashscreen.dart';
import 'package:Wajibika/pages/mda_projects/all_depts.dart';
import 'package:Wajibika/providers/bookmarks_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Wajibika/auth/login.dart';
import 'package:Wajibika/auth/register.dart';
import 'package:Wajibika/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookmarksProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Wajibika',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
          colorScheme: const ColorScheme.light(),
          useMaterial3: true,
        ),
        home: const BasePage(),
        routes: {
          '/splashscreen': (context) => const SplashScreen(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home': (context) => const HomePage(),
          '/basepage' : (context) => const BasePage(),
          '/mda-projects':  (context) => const AllStateDepts(),
          '/citizen-audited-projects': (context) => const CitizenAuditedProjects(),
          '/bookmarks':(context)=> const BookMarksPage(),
      
        },
      ),
    );
  }
}
