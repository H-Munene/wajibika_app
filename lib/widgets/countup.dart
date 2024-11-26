import 'package:flutter/material.dart';
import 'package:countup/countup.dart';

class CounterUpWidget extends StatefulWidget {
  final double begin;
  final double end;
  final Color color;

  const CounterUpWidget({super.key, required this.begin, required this.end, required this.color});

  @override
  State<CounterUpWidget> createState() => _CounterUpWidgetState();
}

class _CounterUpWidgetState extends State<CounterUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Countup(begin: widget.begin, end: widget.end, duration: const Duration(seconds: 10),separator: ',',style: TextStyle(color: widget.color),);
  }
}
