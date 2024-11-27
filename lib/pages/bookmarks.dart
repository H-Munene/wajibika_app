import 'dart:convert';

import 'package:Wajibika/models/statedept_model.dart';
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
 //fetch json
  Future<String> _loadJson() async{
    return await rootBundle.loadString('assets/json/sample.json');
  }

class _BookMarksPageState extends State<BookMarksPage> {
  //variable to store list
  bool _customIcon = false;

  Future loadData() async{
    String jsonString = await _loadJson();
    final jsonResponse = json.decode(jsonString);

    StateDepartment stateDepartment = StateDepartment.fromJson(jsonResponse);
    print("${stateDepartment.stateDepartmentName}, ${stateDepartment.cumulativeContractAmounts}, ${stateDepartment.projects[0].name}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
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
