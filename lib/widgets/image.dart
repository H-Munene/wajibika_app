import 'package:flutter/material.dart';
import 'package:Wajibika/utils/globals.dart' as globals;

class ImageWidget extends StatelessWidget {
  final String assetName;
  final double height;
  final double width;

  const ImageWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          bottom: globals.loginBottomLogoPadding,
          top: globals.topLoginLogoPadding),
      child: Image(
        image: AssetImage(assetName),
        height: height,
        width: width,
        fit: BoxFit.contain,
      ),
    );
  }
}
