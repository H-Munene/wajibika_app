import 'package:flutter/material.dart';
import 'package:Wajibika/utils/globals.dart' as globals;

class RoadsPage extends StatefulWidget {
  const RoadsPage({super.key});

  @override
  State<RoadsPage> createState() => _RoadsPageState();
}

class _RoadsPageState extends State<RoadsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //unproductive  expenditure
        RichText(
            text: const TextSpan(
                text: 'Unproductive Expenditure: ',
                style: TextStyle(fontSize: globals.normalTextFontSize),
                children: [
                  TextSpan(
                    
                  )
                ]))
        //project card
      ],
    );
  }
}
