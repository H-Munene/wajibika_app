import 'package:flutter/material.dart';

class ShareBookMarkWidget extends StatefulWidget {
  const ShareBookMarkWidget({super.key});

  @override
  State<ShareBookMarkWidget> createState() => _ShareBookMarkWidgetState();
}

class _ShareBookMarkWidgetState extends State<ShareBookMarkWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark)),
        ],
      ),
    );
  }
}
