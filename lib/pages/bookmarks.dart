import 'dart:convert';
import 'package:Wajibika/models/statedept_model.dart';
import 'package:Wajibika/utils/globals.dart' as globals;
import 'package:Wajibika/widgets/countup.dart';
import 'package:Wajibika/widgets/share_bookmark_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class BookMarksPage extends StatefulWidget {
  const BookMarksPage({super.key});

  @override
  State<BookMarksPage> createState() => _BookMarksPageState();
}

class _BookMarksPageState extends State<BookMarksPage> {
  late Future<List<StateDepartment>> stateDepartments;
  final bool _customIcon = false;

  Future<List<StateDepartment>> _loadJson() async {
    String jsonString = await rootBundle.loadString('assets/json/sample.json');
    final jsonResponse = json.decode(jsonString) as List;
    return jsonResponse.map((data) => StateDepartment.fromJson(data)).toList();
  }

  @override
  void initState() {
    super.initState();
    stateDepartments = _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StateDepartment>>(
      future: stateDepartments,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No Data Found'));
        } else {
          return SizedBox(
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                StateDepartment stateDepartment = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ExpansionTile(
                      shape: const Border(),
                      title: Text(
                        stateDepartment.stateDepartmentName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: globals.subtitleTextFontSize),
                      ),
                      subtitle: Row(
                        children: [
                          const Text('Status: '),
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: Lottie.asset(
                                  'assets/animations/red_pulse.json')),
                          const Text('Stalled'),
                        ],
                      ),
                      trailing: Icon(_customIcon
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down),
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 200,
                                  child: Text(
                                      'Cumulative Contract amounts from all projects listed below: ')),
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Text(
                                  'Kshs. ${stateDepartment.cumulativeContractAmounts}',
                                  style: TextStyle(color: Colors.green)),
                            ],
                          ),
                        ),

                        //amount paid
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 200,
                                  child: Text(
                                      'Cumulative Amounts Paid from all projects listed below: ')),
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Text(
                                  'Kshs. ${stateDepartment.cumulativeAmountPaid}',
                                  style: TextStyle(color: Colors.red)),
                            ],
                          ),
                        ),
                        Table(
                          border: TableBorder.all(),
                          children: [
                            const TableRow(children: [
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text('Project Name'),
                              )),
                              TableCell(
                                  child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text('Location'),
                              ))
                            ]),
                            ...stateDepartment.projects.map((project) {
                              return TableRow(children: [
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(project.name),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(project.location),
                                ))
                              ]);
                            })
                          ],
                        ),
                        ShareBookMarkWidget()
                      ]),
                );
              },
            ),
          );
        }
      },
    );
  }
}
