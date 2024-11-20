import 'package:flutter/material.dart';
import 'package:Wajibika/utils/globals.dart' as globals;

class TextFormFieldWidget extends StatelessWidget {
  final Icon prependIcon;
  final String placeholder;
  final String? Function(String?) validator;
  final Icon? suffixIcon;
  final TextEditingController controller;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.prependIcon,
    required this.placeholder,
    required this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: globals.bottomPadding,
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: (placeholder == 'Password: *******') ? true : false,
          decoration: InputDecoration(
              prefixIcon: prependIcon,
              suffixIcon: (placeholder == 'Password: *******') ? suffixIcon : null,
              hintText: placeholder,
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(globals.textFieldBorderRadius),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(globals.textFieldBorderRadius),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(globals.textFieldBorderRadius),
                borderSide: const BorderSide(color: Colors.lightGreen),
              ),
              
              labelStyle: const TextStyle(
                  color: globals.placeholderColor,
                  fontSize: globals.normalTextFontSize)),
        ));
  }
}
