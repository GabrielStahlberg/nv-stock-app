import 'package:flutter/material.dart';

class ClothesTabs extends StatefulWidget {
  final String tabName;

  const ClothesTabs({super.key, required this.tabName});

  @override
  State<ClothesTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<ClothesTabs> {

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.tabName));
  }
}
