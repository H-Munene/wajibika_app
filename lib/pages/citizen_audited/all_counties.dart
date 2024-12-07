import 'dart:convert';
import 'package:Wajibika/models/citizen_audit_model.dart';
import 'package:Wajibika/providers/bookmarks_provider.dart';
import 'package:Wajibika/utils/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CitizenAuditedProjects extends StatefulWidget {
  const CitizenAuditedProjects({super.key});

  @override
  State<CitizenAuditedProjects> createState() => _CitizenAuditedProjectsState();
}

class _CitizenAuditedProjectsState extends State<CitizenAuditedProjects> {
  late final List<CitizenAuditData> citizenAuditedProjects;
  late final List<CitizenAuditData> filteredData;
  List<CitizenAuditData> foundCounty = [];

  final TextEditingController searchController = TextEditingController();
  final bool _customIcon = false;
  final isDouble = false;
  bool isLoading = false;
  bool searchIsEmpty = true;

  Future<void> _loadJson() async {
    setState(() {
      isLoading = true;
    });
    final url = Uri.parse('http://127.0.0.1:8000/api/citizen-audited-projects');
    final response = await http.get(url);
    late final dynamic responseData;
    if (response.statusCode == 200) {
      responseData = json.decode(response.body);
    }
    setState(() {
      citizenAuditedProjects = (responseData as List)
          .map(
              (citizenAuditData) => CitizenAuditData.fromJson(citizenAuditData))
          .toList();
      filteredData = citizenAuditedProjects
          .where((data) => data.projects.isNotEmpty)
          .toList();
      foundCounty = filteredData;
      isLoading = false;
    });
  }

  void _runFilter(String enteredValue) {
    List<CitizenAuditData> results = [];
    //no value entered in textfield
    if (enteredValue.isEmpty) {
      //retain all cards
      results = filteredData;
    } else {
      searchIsEmpty = false;
      //filter cards based on the entered value
      results = filteredData
          .where((citizenAuditedProject) => citizenAuditedProject.countyName
              .toLowerCase()
              .contains(enteredValue.toLowerCase()))
          .toList();
    }

    setState(() {
      foundCounty = results;
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
            : Column(
                children: [
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
                                      foundCounty = filteredData;
                                      searchIsEmpty = true;
                                    });
                                  },
                                  icon: const Icon(Icons.close)),
                          hintText: 'County Name',
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
                      itemCount: foundCounty.length,
                      itemBuilder: (context, index) {
                        final citizenAuditProject = foundCounty[index];
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ExpansionTile(
                            shape: const Border(),
                            title: Text(
                              citizenAuditProject.countyName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: globals.subtitleTextFontSize),
                            ),
                            trailing: Icon(_customIcon
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down),
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    //projects
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
                                            child: Text('Amount Allocated'),
                                          )),
                                          TableCell(
                                              child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text('Amount Paid'),
                                          )),
                                          TableCell(
                                              child: Padding(
                                            padding: EdgeInsets.all(8),
                                            child: Text('Status'),
                                          )),
                                        ]),
                                        ...citizenAuditProject.projects
                                            .map((project) {
                                          return TableRow(children: [
                                            //project name
                                            TableCell(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(project.name),
                                            )),
                                            //amount allocated
                                            TableCell(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                project.amountAllocated,
                                                style: const TextStyle(
                                                    color: Colors.green),
                                              ),
                                            )),
                                            //amount paid
                                            TableCell(
                                                child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                project.amountPaid,
                                                style: const TextStyle(
                                                    color: Colors.red),
                                              ),
                                            )),
                                            //status
                                            TableCell(
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child:
                                                        Text(project.status)))
                                          ]);
                                        })
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                provider.toggleCtzBookmark(
                                                    citizenAuditProject);
                                              },
                                              icon: provider.ctzisBookmarked(
                                                      citizenAuditProject)
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
                ],
              ));
  }
}
