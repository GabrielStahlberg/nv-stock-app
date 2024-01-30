import 'package:flutter/material.dart';

class PrintAction extends StatefulWidget {
  const PrintAction({super.key});

  @override
  State<PrintAction> createState() => _PrintActionState();
}

class _PrintActionState extends State<PrintAction> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){

        },
        icon: const Icon(Icons.print, color: Colors.white)
    );
  }
}
