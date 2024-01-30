import 'package:flutter/material.dart';

class FilterAction extends StatefulWidget {
  const FilterAction({super.key});

  @override
  State<FilterAction> createState() => _FilterActionState();
}

class _FilterActionState extends State<FilterAction> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){

        },
        icon: const Icon(Icons.filter_alt, color: Colors.white)
    );
  }
}
