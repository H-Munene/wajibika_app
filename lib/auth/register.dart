import 'package:flutter/material.dart';
import 'package:wajibika_app/utils/globals.dart' as globals;
import 'package:wajibika_app/utils/validationservice.dart';
import 'package:wajibika_app/widgets/image.dart';
import 'package:wajibika_app/widgets/loginregisterbtn.dart';
import 'package:wajibika_app/widgets/textButton.dart';
import 'package:wajibika_app/widgets/textformfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controllers
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  //form key
  final _formKey = GlobalKey<FormState>();

  //toLogin
  void _toLogin() {
    Navigator.pushNamed(context, '/login');
  }

  //register
  void _register() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return globals.registerLoginLayout(Center(
      child: Column(
        children: [
          //logo
          const ImageWidget(
              height: globals.logoheight,
              width: globals.logowidth,
              assetName: globals.logo),
          Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                children: [
                  //firstname
                  TextFormFieldWidget(
                      controller: firstnameController,
                      prependIcon: globals.usernamePrependIcon,
                      placeholder: globals.firstNamePlaceHolder,
                      validator: ValidationService.usernameValidator),
                  //lastname
                  TextFormFieldWidget(
                      controller: lastnameController,
                      prependIcon: globals.usernamePrependIcon,
                      placeholder: globals.lastNamePlaceHolder,
                      validator: ValidationService.usernameValidator),
                  //email
                  TextFormFieldWidget(
                      controller: emailController,
                      prependIcon: globals.emailPrependIcon,
                      placeholder: globals.emailPlaceholder,
                      validator: ValidationService.emailValidator),
                  //password
                  TextFormFieldWidget(
                      controller: passwordController,
                      prependIcon: globals.passwordPrependIcon,
                      suffixIcon: globals.appendHidePasswordIcon,
                      placeholder: globals.passwordPlaceHolder,
                      validator: ValidationService.passwordValidator),
                  //confirm password
                  TextFormFieldWidget(
                      controller: confirmPasswordController,
                      prependIcon: globals.passwordPrependIcon,
                      suffixIcon: globals.appendHidePasswordIcon,
                      placeholder: globals.passwordPlaceHolder,
                      validator: ValidationService.passwordValidator),
                  //register btn
                  LoginRegisterButtonWidget(
                      clickAction: _register,
                      btnColor: globals.registerBGColor,
                      buttonText: globals.registerBtnText),
                  //already registered? Login
                  TextButtonWidget(
                      btnText: globals.alreadyRegistered,
                      clickAction: _toLogin),
                ],
              ))
        ],
      ),
    ));
  }
}
