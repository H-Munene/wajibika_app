import 'dart:convert';
import 'package:Wajibika/utils/globals.dart' as globals;
import 'package:Wajibika/widgets/countup.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //OAG audit
          SizedBox(
            width: 0.9 * MediaQuery.of(context).size.width,
            child: Column(
              children: [
                //source
                Text(
                  "source: SUMMARY OF THE AUDITOR-GENERAL'S REPORT ON NATIONAL GOVERNMENT 2022/2023",
                  style: const TextStyle(
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 8)),
                //title
                Text(
                  "Stalled Projects Under Ministries, Departments and Agencies (MDAs)",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: globals.titleFontSize),
                ),
                //number of projects
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    const SizedBox(
                        width: 200, child: Text('Projects in Focus:    38')),
                  ],
                ),

                //contract amounts
                Row(
                  children: [
                    const SizedBox(
                        width: 190,
                        child: Text('Total Cumulative Contract amounts: ')),
                    const Text('Kshs.  ',
                        style: TextStyle(color: Colors.green)),
                    CounterUpWidget(
                        end: double.parse('3716569830'), color: Colors.green)
                  ],
                ),
                //amounts paid
                Row(
                  children: [
                    const SizedBox(
                        width: 190,
                        child: Text('Total Cumulative Amounts Paid: ')),
                    const Text('Kshs.  ', style: TextStyle(color: Colors.red)),
                    CounterUpWidget(
                        end: double.parse('3100222841'), color: Colors.red)
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 185, child: Text('As of: ')),
                    Text('  30 June, 2023')
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: null, child: Text('More details')),
                  ],
                )
              ],
            ),
          ),
          Divider(),
          //Citizen Audit
          SizedBox(
            width: 0.9 * MediaQuery.of(context).size.width,
            child: Column(
              children: [
                //source
                Text(
                  "source: https://x.com/MoraraKebasoSnr/status/1855594379425062936?t=a1bAaiEXelSF3exM6NgkHA&s=19 and https://x.com/MoraraKebasoSnr/status/1855593880495833507?t=AE01ygz1CZdtPZ1jrEZLcg&s=19",
                  style: const TextStyle(
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 8)),
                //title
                Text(
                  "Citizen-Led Oversight on the status of projects countrywide",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: globals.titleFontSize),
                ),
                //number of projects
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    const SizedBox(
                        width: 190, child: Text('Projects in focus: ')),
                    Text('38'),
                  ],
                ),
                //approximate taxpayer money lost
                Row(
                  children: [
                    const SizedBox(
                        width: 185,
                        child:
                            Text('Approximate Value of Taxpayer money Lost: ')),
                    const Text('Kshs.  ', style: TextStyle(color: Colors.red)),
                    CounterUpWidget(
                        end: double.parse('96547300000'), color: Colors.red)
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 185, child: Text('As of: ')),
                    Text('14 August, 2024')
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: null, child: Text('More details')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
