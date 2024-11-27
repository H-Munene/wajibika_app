import 'dart:convert';

import 'package:Wajibika/utils/globals.dart';
import 'package:Wajibika/widgets/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class BookMarksPage extends StatefulWidget {
  const BookMarksPage({super.key});

  @override
  State<BookMarksPage> createState() => _BookMarksPageState();
}

class _BookMarksPageState extends State<BookMarksPage> {
  //variable to store list
  dynamic projects = [];
  bool _customIcon = false;

  @override
  void initState() {
    super.initState();
    readJson();
  }

  //fetch json
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/sample.json');
    final data = await json.decode(response);
    setState(() {
      projects = data['details'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        
      ),
    );
  }
}
