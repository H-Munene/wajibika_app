import 'package:flutter/material.dart';
import 'package:wajibika_app/utils/globals.dart' as globals;

class TextFormFieldWidget extends StatelessWidget {
  final Icon prependIcon;
  final String placeholder;
  final String? Function(String?) validator;
  final Icon? suffixIcon;

  const TextFormFieldWidget(
      {super.key,
      required this.prependIcon,
      required this.placeholder,
      required this.validator,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: globals.bottomPadding,
        child: TextFormField(
          validator: validator,
          obscureText: (placeholder == 'Password: *******') ? true : false,
          decoration: InputDecoration(
              prefixIcon: prependIcon,
              suffixIcon: suffixIcon,
              hintText: placeholder,
              labelStyle: const TextStyle(
                  color: globals.placeholderColor,
                  fontSize: globals.normalTextFontSize)),
        ));
  }
}
