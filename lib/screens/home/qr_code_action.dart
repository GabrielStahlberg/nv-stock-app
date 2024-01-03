import 'package:flutter/material.dart';
class QrCodeAction extends StatefulWidget {
  const QrCodeAction({super.key});

  @override
  State<QrCodeAction> createState() => _QrCodeActionState();
}

class _QrCodeActionState extends State<QrCodeAction> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){

      },
      icon: const Icon(Icons.qr_code_2, color: Colors.white)
    );
  }
}
