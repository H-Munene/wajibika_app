import 'package:Wajibika/models/citizen_audit_model.dart';
import 'package:Wajibika/utils/globals.dart' as globals;
import 'package:Wajibika/widgets/share_bookmark_row.dart';
import 'package:flutter/material.dart';

class CitizenAuditedProjects extends StatefulWidget {
  const CitizenAuditedProjects({super.key});

  @override
  State<CitizenAuditedProjects> createState() => _CitizenAuditedProjectsState();
}

class _CitizenAuditedProjectsState extends State<CitizenAuditedProjects> {
  late final List<CitizenAuditData> citizenAuditedProjects;
  final bool _customIcon = false;
  final isDouble = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading ? const Center(child:  CircularProgressIndicator(),): ListView.builder(
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: citizenAuditedProjects.length,
      itemBuilder: (context, index) {
        final citizenAuditProject = citizenAuditedProjects[index];
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
            trailing:
                Icon(_customIcon ? Icons.arrow_drop_up : Icons.arrow_drop_down),
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
                        ...citizenAuditProject.projects.map((project) {
                          return TableRow(children: [
                            //project name
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(project.name),
                            )),
                            //amount allocated
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(project.amountAllocated),
                            )),
                            //amount paid
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(project.amountPaid),
                            )),
                            //status
                            TableCell(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(project.status),
                            ))
                          ]);
                        })
                      ],
                    ),
                    const ShareBookMarkWidget()
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}