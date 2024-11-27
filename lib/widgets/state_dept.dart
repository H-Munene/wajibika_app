import 'package:Wajibika/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:Wajibika/widgets/countup.dart';
import 'package:lottie/lottie.dart';

class StateDepartentItem extends StatefulWidget {
  const StateDepartentItem({super.key});

  @override
  State<StateDepartentItem> createState() => _StateDepartentItemState();
}

class _StateDepartentItemState extends State<StateDepartentItem> {
  bool _customIcon = false;
  dynamic projects = [];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   readJson();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ExpansionTile(
            title: const Text(
              'Interior and Citizen Services',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: subtitleTextFontSize),
            ),
            shape: const Border(),
            trailing: Icon(
                _customIcon ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    //contract amount
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: const Row(
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(
                                  'Cumulative Contract amounts from all projects listed below: ')),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text('Kshs.  ',
                              style: TextStyle(color: Colors.green)),
                          CounterUpWidget(
                              end: 995275385, color: Colors.green),
                        ],
                      ),
                    ),
    
                    //amount paid
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: const Row(
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(
                                  'Cumulative Amounts Paid from all projects listed below: ')),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text('Kshs.  ',
                              style: TextStyle(color: Colors.red)),
                          CounterUpWidget(end: 156968272, color: Colors.red),
                        ],
                      ),
                    ),
                    //status , pulse animation
                    Row(
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
                    Table(
                      border: TableBorder.all(),
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: const [
                        TableRow(children: [
                          TableCell(child: Text('Projects')),
                          TableCell(child: Text('Location')),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child:
                                  Text('Construction of DCC office block')),
                          TableCell(child: Text('Tigania, Meru')),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text(
                                  'Construction of Tigania East Sub-County office block')),
                          TableCell(child: Text('Muriri, Meru')),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text(
                                  'Construction of Magunga District Headquarters Suba South Sub-County')),
                          TableCell(child: Text('Homa-bay')),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text(
                                  'Delayed completion of Mwea West Sub-County Headquarters')),
                          TableCell(child: Text('Kirinyaga')),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text(
                                  'Construction of 100 PAX hostel block at Kenya School of Adventure and Leadership')),
                          TableCell(child: Text('Meru')),
                        ]),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.share)),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.bookmark)),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
            onExpansionChanged: (bool expanded) {
              setState(() {
                _customIcon = expanded;
              });
            },
          ),
        ),
      ],
    );
  }
}
