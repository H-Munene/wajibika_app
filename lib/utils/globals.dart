import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//padding
const bottomPadding = EdgeInsets.only(bottom: 20); //specific cto widgets
const LRPadding = EdgeInsets.only(left: 20, right: 20); //left - right padding
const double loginBottomTitlePadding = 40;
const double topTitlePadding = 35;
const double forgotpassBottomTitlePadding = 150;
const double forgotpassTopTitlePadding = 45;
const double ordersPageAllPadding = 20;

const String appTitle = 'Wajibika';

//placeholders
const String passwordPlaceHolder = 'Password: *******';

//fonts
const double titleFontSize = 30;
const double subtitleTextFontSize = 20;
const double normalTextFontSize = 15;

//colors
const primaryColor = Colors.white;
const placeholderColor = Color(0xFF9A9A9A);
const appBackGroundColor = Color(0xFFF0E7D8);
const subtitleColor = Color(0xFF4F4F4F);
const buttonTextColor = Color(0xFFFFFFFF);
const buttonBGColor = Color(0xFF6C4B5E);
const itemtotalBtnColor = Color(0xFF6DA34D);

//icons
const Icon emailPrependIcon = Icon(Icons.email);
const Icon passwordPrependIcon = Icon(Icons.key);
const Icon appendShowPasswordIcon = Icon(Icons.visibility);
const Icon appendHidePasswordIcon = Icon(Icons.visibility_off);

//base layout
registerLoginLayout(Widget targetPage) {
  return Scaffold(
    appBar: AppBar(
      title:
          const Text(appTitle, style: TextStyle(fontStyle: FontStyle.italic)),
      backgroundColor: primaryColor,
      automaticallyImplyLeading: false,
    ),
    body: SafeArea(child: targetPage),
  );
}
