import 'package:flutter/material.dart';
import 'package:Wajibika/widgets/countup.dart';
class StateDepartentItem extends StatefulWidget {
  const StateDepartentItem({super.key});

  @override
  State<StateDepartentItem> createState() => _StateDepartentItemState();
}

class _StateDepartentItemState extends State<StateDepartentItem> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text('Contract Amount : '),
                  CounterUpWidget(
                    begin: 0,
                    end: 995275385,
                    color: Colors.green,
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Amount Paid: '),
                  CounterUpWidget(
                    begin: 0,
                    end: 156968272,
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
