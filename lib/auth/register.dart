import 'dart:convert';

import 'package:Wajibika/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:Wajibika/utils/globals.dart' as globals;
import 'package:Wajibika/utils/validationservice.dart';
import 'package:Wajibika/widgets/image.dart';
import 'package:Wajibika/widgets/loginregisterbtn.dart';
import 'package:Wajibika/widgets/textformfield.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  var isLoading = false;

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
  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final url = Uri.parse('http://127.0.0.1:8000/api/register');
      final Response response = await http.post(url, body: {
        'email': emailController.text,
        'password': passwordController.text
      });
      final responseData = json.decode(response.body);
      final responseMessage = responseData['message'];

      if (response.statusCode == 201) {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$responseMessage'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green,
        ));
        Navigator.pushNamed(context, '/login');
      } else {
        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('$responseMessage'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  void _clearForm() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void dispose() {
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
