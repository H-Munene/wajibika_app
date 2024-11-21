import 'package:Wajibika/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:Wajibika/utils/globals.dart' as globals;
import 'package:Wajibika/utils/validationservice.dart';
import 'package:Wajibika/widgets/image.dart';
import 'package:Wajibika/widgets/loginregisterbtn.dart';
import 'package:Wajibika/widgets/textformfield.dart';

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

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  //form key
  final _formKey = GlobalKey<FormState>();

  String? _confirmpasswordValidator(String? confirmPassword) {
    return (confirmPassword == null || confirmPassword.isEmpty)
        ? 'Please enter a password'
        : (!globals.passwordExp.hasMatch(confirmPassword))
            ? 'Your password should have at leat 6 characters'
            : (confirmPasswordController.text != passwordController.text)
                ? 'Passwords do not match'
                : null;
  }

  //toLogin
  void _toLogin() {
    Navigator.pushNamed(context, '/login');
  }

  //register
  void _register() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        firstName = firstnameController.text;
        lastName = lastnameController.text;
        email = emailController.text;
        password = passwordController.text;
        confirmPassword = confirmPasswordController.text;
        _clearForm();
      });

      Navigator.pushNamed(context, '/home');
    }
  }

  void _clearForm() {
    firstnameController.clear();
    lastnameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
              autovalidateMode: AutovalidateMode.disabled,
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
                      validator: _confirmpasswordValidator),
                  //register btn
                  LoginRegisterButtonWidget(
                      clickAction: _register,
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
