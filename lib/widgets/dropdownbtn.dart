import 'package:flutter/material.dart';

class DropDownButtonWidget extends StatefulWidget {
  final List items;
  final void Function(dynamic)? onChanged;
  final dynamic display;

  const DropDownButtonWidget(
      {super.key,
      required this.items,
      required this.display,
      required this.onChanged});

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: DropdownButton(
        
          value: widget.display,
          items: widget.items
              .map((menuitem) => DropdownMenuItem(
                    value: menuitem,
                    child: Text(menuitem),
                  ))
              .toList(),
          onChanged: widget.onChanged),
    );
  }
}