import 'package:Wajibika/pages/statedepts/all_depts.dart';
import 'package:Wajibika/utils/data.dart';
import 'package:Wajibika/widgets/titlebar_row.dart';
import 'package:flutter/material.dart';
import 'package:Wajibika/utils/globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _financialYear = financialYears[0];

  void _setContentFinacialYear(year) {
    setState(() {
      _financialYear = year;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 5),
        child: Center(
          child: Column(
            children: [
              //Category bar : row -> (Category title, category item) -> filter icon
              TitleBarRow(),
              //chart
              Divider(
                color: globals.loginBtnColor,
              ),
              //list of categories
              AllStateDepts()
            ],
          ),
        ),
      ),
    );
  }
}
