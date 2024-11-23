import 'package:flutter/material.dart';

class DropDownMenuWidget extends StatefulWidget {
  final List menuItemsList;
  final void Function(dynamic)? onSelected;
  final TextEditingController controller;

  const DropDownMenuWidget(
      {super.key,
      required this.menuItemsList,
      required this.onSelected,
      required this.controller});

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {
  List? _menuItems;
  void Function(dynamic)? _onSelected;
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _menuItems = widget.menuItemsList;
    _onSelected = widget.onSelected;
    _controller = widget.controller;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 160,
      controller: _controller,
      initialSelection: _menuItems![0],
      dropdownMenuEntries: _menuItems!
          .map((menu_item) =>
              DropdownMenuEntry(value: menu_item, label: menu_item))
          .toList(),
      onSelected: _onSelected,
    );
  }
}
