import 'package:flutter/material.dart';
import 'package:wajibika_app/utils/globals.dart' as globals;
import 'package:wajibika_app/widgets/image.dart';
import 'package:wajibika_app/widgets/loginregisterbtn.dart';
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

  //email validation
  String? _emailValidator(String? email) {
    return 'Please enter email address';
  }

  //password validation
  String? _passwordValidator(String? password) {
    return 'Please enter a password';
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return globals.registerLoginLayout(Padding(
      padding: globals.LRPadding,
      child: Center(
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormFieldWidget(
                      controller: emailController,
                      prependIcon: globals.emailPrependIcon,
                      placeholder: globals.emailPlaceholder,
                      validator: _emailValidator),
                  TextFormFieldWidget(
                    controller: passwordController,
                    prependIcon: globals.passwordPrependIcon,
                    placeholder: globals.passwordPlaceHolder,
                    validator: _passwordValidator,
                    suffixIcon: globals.appendHidePasswordIcon,
                  ),
                  //login button
                  LoginRegisterButtonWidget(
                      clickAction: _submit,
                      btnColor: globals.loginBtnColor,
                      buttonText: globals.loginBtnText),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
