import 'package:Wajibika/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:Wajibika/utils/globals.dart' as globals;
import 'package:Wajibika/utils/validationservice.dart';
import 'package:Wajibika/widgets/image.dart';
import 'package:Wajibika/widgets/loginregisterbtn.dart';
import 'package:Wajibika/widgets/textformfield.dart';


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
      Navigator.pushNamed(context, '/splashscreen');
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
