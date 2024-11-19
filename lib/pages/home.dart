import 'package:flutter/material.dart';
import 'package:wajibika_app/utils/globals.dart' as gloabls;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return gloabls.baseLayout(
      const Center(
        child: Column(
          children: [
            Text('Home Page')
          ],
        ),
      )
    );
  }
}