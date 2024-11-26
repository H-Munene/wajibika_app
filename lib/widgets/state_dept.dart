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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, left: 10),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [ Text('Roads', style: TextStyle(fontWeight: FontWeight.bold, fontSize: subtitleTextFontSize),)]),
          //contract amount
          Row(
            children: [
              Text('Contract amount: '),
              CounterUpWidget(end: 180000000, color: Colors.green),
            ],
          ),
          //amount paid
          Row(
            children: [
              Text('Amount Paid: '),
              CounterUpWidget(end: 20234000, color: Colors.red),
            ],
          ),
          Row(
            children: [
              Text('Status: '),
              SizedBox(
                  height: 30,
                  width: 30,
                  child: Lottie.asset('assets/animations/red_pulse.json')),
                  const Text('Stalled')
            ],
          )
        ],
      ),
    );
  }
}
