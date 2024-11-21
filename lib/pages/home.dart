import 'package:Wajibika/utils/data.dart';
import 'package:Wajibika/widgets/dropdownbtn.dart';
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
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Center(
        child: Column(
          children: [
            DropDownButtonWidget(
                items: financialYears,
                display: _financialYear,
                onChanged: _setContentFinacialYear)
            //Category bar : row -> (Category title, category item) -> filter icon

            //chart

            //list of categories
          ],
        ),
      ),
    );
  }
}
