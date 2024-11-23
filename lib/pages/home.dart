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
  final String _asof = '30 June, 2023';

  void _setContentFinacialYear(year) {
    setState(() {
      _financialYear = year;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Center(
        child: Column(
          children: [
            // DropDownButtonWidget(
            //     items: financialYears,
            //     display: _financialYear,
            //     onChanged: _setContentFinacialYear),
            //Category bar : row -> (Category title, category item) -> filter icon
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Category item
                    const Text(
                      'State Department',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: globals.subtitleTextFontSize),
                    ),
                    //as of financial year
                    Text(
                      'Roads | as of $_asof',
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const Expanded(
                    child: SizedBox(
                  width: 20,
                )),
                Row(
                  children: [
                    const Text(
                      'Filter',
                      style: TextStyle(fontSize: 13),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_alt),
                      style: const ButtonStyle(),
                    )
                  ],
                )

                //filter
              ],
            ),
            //chart
            const Divider(
              color: globals.loginBtnColor,
            )
            //list of categories
          ],
        ),
      ),
    );
  }
}
