import 'package:Wajibika/providers/bookmarks_provider.dart';
import 'package:Wajibika/utils/globals.dart' as globals;
import 'package:Wajibika/widgets/countup.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BookMarksPage extends StatefulWidget {
  const BookMarksPage({super.key});

  @override
  State<BookMarksPage> createState() => _BookMarksPageState();
}

class _BookMarksPageState extends State<BookMarksPage> {
  final bool _customIcon = false;

  bool parsetoDouble(String value) {
    try {
      double.parse(value);
      return true;
    } catch (e) {
      return false;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final provider  = Provider.of<BookmarksProvider>(context);
    final foundStateDepartment = provider.stateDepartments;
    final foundCounty = provider.citizenAuditData;
    return  Center(
      child: Column(
        children: [
          ListView.builder(
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
                  //other listview builder
                  ListView.builder(
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
        ],
      ),
    );
  }
}
