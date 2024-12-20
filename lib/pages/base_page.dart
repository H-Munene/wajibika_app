import 'package:Wajibika/pages/bookmarks.dart';
import 'package:Wajibika/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:Wajibika/utils/globals.dart' as globals;

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  //list of pages
  final List _pages = [
    const HomePage(),
    const BookMarksPage(),

  ];

  //page index
  int bottomNavBarItemIndex = 0;

  //navigate the bottomnavbar
  void _bottom_navbar_navigation(int index) {
    setState(() {
      bottomNavBarItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Image(
          image: AssetImage(globals.logo),
          width: globals.appBarLogoWidth,
          height: globals.logoheight,
        ),
        backgroundColor: globals.primaryColor,
        automaticallyImplyLeading: true,
        
      ),
      body:  SingleChildScrollView(child:   _pages[bottomNavBarItemIndex]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavBarItemIndex,
          onTap: _bottom_navbar_navigation,
          items: const [
            //home
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            //bookmark
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: 'Bookmarks'),
          
          ]),
    );
  }
}