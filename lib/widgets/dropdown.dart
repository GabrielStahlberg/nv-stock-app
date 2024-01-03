import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final Function(dynamic)? onChanged;
  final String hint;
  final String value;
  final double widthSize;
  final bool isExpanded;

  const DropDown({
    Key? key,
    this.hint = "",
    this.isExpanded = false,
    required this.value,
    required this.items,
    required this.widthSize,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      items: items,
      onChanged: onChanged,
      isExpanded: isExpanded,
      icon: const Icon(Icons.arrow_drop_down),
      hint: Text(hint),
      style: TextStyle(
          color: Colors.black,
          fontSize: widthSize * 0.04
      ),
    );
  }
}