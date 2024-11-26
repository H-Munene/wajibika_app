import 'package:flutter/material.dart';
import 'package:Wajibika/utils/globals.dart' as globals;

class TitleBarRow extends StatefulWidget {
  const TitleBarRow({super.key});

  @override
  State<TitleBarRow> createState() => _TitleBarRowState();
}

class _TitleBarRowState extends State<TitleBarRow> {
  final String _asof = '30 June, 2023';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Category item
            const Text(
              'State Departments',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: globals.subtitleTextFontSize),
            ),
            //as of financial year
            Text(
              'as of $_asof',
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
        const Expanded(
            child: SizedBox(
          width: 20,
        )),
        Row(
          children: [
            const Text(
              'Filter',
              style: TextStyle(fontSize: 13),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_alt),
              style: const ButtonStyle(),
            )
          ],
        )

        //filter
      ],
    );
  }
}
