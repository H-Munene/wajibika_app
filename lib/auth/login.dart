import 'dart:async';
import 'dart:convert';

import 'package:Wajibika/widgets/richtex_register_login.dart';
import 'package:flutter/material.dart';
import 'package:Wajibika/utils/globals.dart' as globals;
import 'package:Wajibika/utils/validationservice.dart';
import 'package:Wajibika/widgets/image.dart';
import 'package:Wajibika/widgets/loginregisterbtn.dart';
import 'package:Wajibika/widgets/textformfield.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Textformfields controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  //form key
  final _formKey = GlobalKey<FormState>();

  //submit form
  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      final url = Uri.parse("http://127.0.0.1:8000/api/login");
      final response = await http.post(url, body: {
        'email': emailController.text,
        'password': passwordController.text
      });
      var responseData = json.decode(response.body);
      final responseMessage = responseData['message'];
      late final String token ;

      

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });

        token = responseData['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$responseMessage'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ));
        Timer(const Duration(seconds: 2), () {
          Navigator.pushNamed(context, '/basepage');
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$responseMessage'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ));
        setState(() {
          isLoading = false;
        });
      }
      _clearForm();
    }
  }

  void _clearForm() {
    emailController.clear();
    passwordController.clear();
  }

  //to register page
  void _toRegister() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return globals.registerLoginLayout(Center(
      child: Column(
        children: [
          //add logo
          const ImageWidget(
              height: globals.logoheight,
              width: globals.logowidth,
              assetName: globals.logo),
          //add textformfields
          Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUnfocus,
            child: Column(
              children: [
                TextFormFieldWidget(
                    controller: emailController,
                    prependIcon: globals.emailPrependIcon,
                    placeholder: globals.emailPlaceholder,
                    validator: ValidationService.emailValidator),
                TextFormFieldWidget(
                  controller: passwordController,
                  prependIcon: globals.passwordPrependIcon,
                  placeholder: globals.passwordPlaceHolder,
                  validator: ValidationService.passwordValidator,
                  suffixIcon: globals.appendHidePasswordIcon,
                ),
                //login button
                isLoading
                    ? SizedBox(
                        height: globals.buttonHeight,
                        width: globals.buttonWidth,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: globals.loginBtnColor,
                            ),
                            child: const CircularProgressIndicator(
                              strokeWidth: 2.0,
                            )),
                      )
                    : LoginRegisterButtonWidget(
                        clickAction: _submit, buttonText: globals.loginBtnText),
                //not a user? register
                const RichTextRegisterLogin(alreadyLoginOrRgister: 'Not Registered? ', loginOrRegister: 'R E G I S T E R', redirect: '/register')
              ],
            ),
          )
        ],
      ),
    ));
  }
}
