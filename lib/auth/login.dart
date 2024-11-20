import 'package:flutter/material.dart';
import 'package:wajibika_app/utils/globals.dart' as globals;
import 'package:wajibika_app/utils/validationservice.dart';
import 'package:wajibika_app/widgets/image.dart';
import 'package:wajibika_app/widgets/loginregisterbtn.dart';
import 'package:wajibika_app/widgets/textButton.dart';
import 'package:wajibika_app/widgets/textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Textformfields controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //form key
  final _formKey = GlobalKey<FormState>();

  //submit form
  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home');
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
                LoginRegisterButtonWidget(
                    clickAction: _submit, buttonText: globals.loginBtnText),
                //not a user? register
                TextButtonWidget(
                    btnText: globals.notaUser, clickAction: _toRegister)
              ],
            ),
          )
        ],
      ),
    ));
  }
}
