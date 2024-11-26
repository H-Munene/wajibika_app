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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        children: [
          Card(
            child: ExpansionTile(
              title: const Text(
                'Interior Services',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: subtitleTextFontSize),
              ),
              shape: const Border(),
              trailing: Icon(
                  _customIcon ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      //contract amount
                      const Row(
                        children: [
                          Text('Contract amount: '),
                          CounterUpWidget(end: 180000000, color: Colors.green),
                        ],
                      ),
                      //amount paid
                      const Row(
                        children: [
                          Text('Amount Paid: '),
                          CounterUpWidget(end: 20234000, color: Colors.red),
                        ],
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
                      DataTable(columns: const [
                        //Project(s)
                        DataColumn(label: Text('Project(s)')),
                        //Location
                        DataColumn(label: Text('Location')),
                        //amount allocated
                        DataColumn(label: Text('amount allocated(Kshs.)')),
                        //amount paid
                        DataColumn(label: Text('amount paid(Kshs.)')),
                      ], rows: const [
                        DataRow(cells: [
                          DataCell(Text('Borehole project at Njiiri School')),
                          DataCell(Text("Murang'a")),
                          DataCell(Text('9,430,012')),
                          DataCell(Text('5,813,700')),
                        ]),
                      
                        DataRow(cells: [
                          DataCell(Text('Borehole project at Njiiri School')),
                          DataCell(Text("Murang'a")),
                          DataCell(Text('')),
                          DataCell(Text('5,813,700')),
                        ]),
                      ])
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
      ),
    );
  }
}
