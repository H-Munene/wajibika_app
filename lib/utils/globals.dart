import 'package:flutter/material.dart';

//padding
const bottomPadding = EdgeInsets.only(bottom: 20); //specific cto widgets
const LRPadding = EdgeInsets.only(left: 20, right: 20); //left - right padding
const double loginBottomLogoPadding = 40;
const double topLoginLogoPadding = 10;
const double ordersPageAllPadding = 20;

//titles
const String appTitle = 'Wajibika';

//placeholders
const String passwordPlaceHolder = 'Password: *******';
const String firstNamePlaceHolder = 'First Name: John';
const String lastNamePlaceHolder = 'Last Name: Doe';
const String emailPlaceholder = 'Email: johndoe@gmail.com';

//buttontext
const String loginBtnText = 'L O G I N';
const String registerBtnText = 'R E G I S T E R';
const String notaUser = 'Not a user? Register';
const String alreadyRegistered = 'Already Registered? Login';

//button dimensions
const double buttonHeight = 50;
const double buttonWidth = 400;
const double ordersBtnWidth = 100;
const double ordersBtnHeight = 25;
const double textFieldBorderRadius = 15;

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
const loginBtnColor = Color.fromARGB(255, 107, 154, 80);
const registerBGColor = Color(0xFF9A6735);

//icons
const Icon emailPrependIcon = Icon(Icons.email);
const Icon passwordPrependIcon = Icon(Icons.key);
const Icon appendShowPasswordIcon = Icon(Icons.visibility);
const Icon appendHidePasswordIcon = Icon(Icons.visibility_off);
const Icon usernamePrependIcon = Icon(Icons.person);

// //image paths
const String logo = 'assets/images/logo.png';

//image dimensions
const double logoheight = 40;
const double logowidth = 100;
const double appBarLogoWidth = 100;

//REGEX form validation
final passwordExp = RegExp(r'^.{6,}$'); //password not less than 6
final nameRegExp = RegExp(r'^[a-zA-Z]+$'); //name regex
final emailRegExp = RegExp(
  r'^[^@]+@[^@]+\.[^@]+',
); // email regex

//login-register a
registerLoginLayout(Widget targetPage) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: primaryColor,
      automaticallyImplyLeading: false,
    ),
    body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
      padding: LRPadding,
      child: targetPage,
    ))),
  );
}
