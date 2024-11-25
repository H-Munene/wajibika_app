import 'package:flutter/material.dart';
import 'package:countup/countup.dart';
import 'package:Wajibika/utils/globals.dart' as globals;

class CountUpWidget extends StatefulWidget {
  final double end;

  const CountUpWidget({super.key, required this.end});

  @override
  State<CountUpWidget> createState() => _CountUpWidgetState();
}

class _CountUpWidgetState extends State<CountUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Countup(
      begin: 0,
      end: widget.end,
      separator: ',',
      duration: Duration(seconds: 30),
      style: const TextStyle(
          color: Colors.red, fontSize: globals.subtitleTextFontSize,), 
    );
  }
}
