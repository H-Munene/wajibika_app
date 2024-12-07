import 'dart:convert';
import 'package:Wajibika/models/statedept_model.dart';
import 'package:Wajibika/pages/bookmarks.dart';
import 'package:Wajibika/providers/bookmarks_provider.dart';
import 'package:Wajibika/utils/globals.dart' as globals;
import 'package:Wajibika/widgets/countup.dart';
import 'package:Wajibika/widgets/share_bookmark_row.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AllStateDepts extends StatefulWidget {
  const AllStateDepts({super.key});

  @override
  State<AllStateDepts> createState() => _AllStateDeptsState();
}

class _AllStateDeptsState extends State<AllStateDepts> {
  late final List<StateDepartment> stateDepartments;
  List<StateDepartment> foundStateDepartment = [];
  final TextEditingController searchController = TextEditingController();

  final bool _customIcon = false;
  final isDouble = false;
  bool isLoading = false;
  bool searchIsEmpty = true;

  Future<void> _loadJson() async {
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse('http://127.0.0.1:8000/api/mda-projects');
    final response = await http.get(url);
    late final dynamic responseData;
    if (response.statusCode == 200) {
      responseData = json.decode(response.body);
    }
    setState(() {
      stateDepartments = (responseData as List)
          .map((stateDepartment) => StateDepartment.fromJson(stateDepartment))
          .toList();
      foundStateDepartment = stateDepartments;
      isLoading = false;
    });
  }

  bool parsetoDouble(String value) {
    try {
      double.parse(value);
      return true;
    } catch (e) {
      return false;
    }
  }

  void _runFilter(String enteredValue) {
    List<StateDepartment> results = [];
    //no value entered in textfield
    if (enteredValue.isEmpty) {
      //retain all cards
      results = stateDepartments;
    } else {
      searchIsEmpty = false;
      //filter cards based on the entered value
      results = stateDepartments
          .where((stateDepartment) => stateDepartment.stateDepartmentName
              .toLowerCase()
              .contains(enteredValue.toLowerCase()))
          .toList();
    }

    setState(() {
      foundStateDepartment = results;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookmarksProvider>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(children: [
                //search
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                        suffixIcon: searchIsEmpty
                            ? const Icon(Icons.search)
                            : IconButton(
                                onPressed: () {
                                  searchController.clear();
                                  setState(() {
                                    foundStateDepartment = stateDepartments;
                                    searchIsEmpty = true;
                                  });
                                },
                                icon: const Icon(Icons.close)),
                        hintText: 'StateDepartments',
                        hintStyle: const TextStyle(
                            fontSize: globals.normalTextFontSize,
                            color: globals.placeholderColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: foundStateDepartment.length,
                    itemBuilder: (context, index) {
                      final stateDepartment = foundStateDepartment[index];
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ExpansionTile(
                          shape: const Border(),
                          title: Text(
                            stateDepartment.stateDepartmentName,
                            style: const TextStyle(
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
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                            width: 200,
                                            child: Text(
                                                'Cumulative Contract amounts from all projects listed below: ')),
                                        const Text('Kshs.  ',
                                            style:
                                                TextStyle(color: Colors.green)),
                                        parsetoDouble(stateDepartment
                                                .cumulativeContractAmounts)
                                            ? CounterUpWidget(
                                                end: double.parse(stateDepartment
                                                    .cumulativeContractAmounts),
                                                color: Colors.green)
                                            : Text(
                                                stateDepartment
                                                    .cumulativeContractAmounts,
                                                style: const TextStyle(
                                                    color: Colors.green)),
                                      ],
                                    ),
                                  ),

                                  //amount paid
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                            width: 200,
                                            child: Text(
                                                'Cumulative Amounts Paid from all projects listed below: ')),
                                        const Text('Kshs.  ',
                                            style:
                                                TextStyle(color: Colors.red)),
                                        parsetoDouble(stateDepartment
                                                .cumulativeAmountPaid)
                                            ? CounterUpWidget(
                                                end: double.parse(
                                                    stateDepartment
                                                        .cumulativeAmountPaid),
                                                color: Colors.red)
                                            : Text(
                                                stateDepartment
                                                    .cumulativeAmountPaid,
                                                style: const TextStyle(
                                                    color: Colors.red)),
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
                                      ...stateDepartment.projects
                                          .map((project) {
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
                                  Container(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              provider.toggleBookmark(
                                                  stateDepartment);
                                            },
                                            icon: provider.isBookmarked(
                                                    stateDepartment)
                                                ? const Icon(Icons.bookmark)
                                                : const Icon(
                                                    Icons.bookmark_outline)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ]));
  }
}
