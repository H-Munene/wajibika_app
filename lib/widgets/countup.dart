import 'package:flutter/material.dart';
import 'package:countup/countup.dart';

class CounterUpWidget extends StatefulWidget {
  final double end;
  final Color color;

  const CounterUpWidget({super.key, required this.end, required this.color});

  @override
  State<CounterUpWidget> createState() => _CounterUpWidgetState();
}

class _CounterUpWidgetState extends State<CounterUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Countup(begin: 0, end: widget.end, duration: const Duration(seconds: 10),separator: ',',style: TextStyle(color: widget.color, fontSize: 18),);
  }
}
