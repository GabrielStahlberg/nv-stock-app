import 'package:flutter/material.dart';
import 'package:nv_stock_app/constants.dart';

class AlertDialogPopup extends StatelessWidget {
  final Widget content;
  final VoidCallback? onPress;
  final String title;
  final Color titleColor;
  final String negativeButton;
  final String positiveButton;
  final bool showCancelButton;
  final bool showOkButton;
  final double widthSize;

  const AlertDialogPopup({
    Key? key,
    this.title = "",
    this.titleColor = Colors.black,
    this.negativeButton = "Cancel",
    this.positiveButton = "Ok",
    this.showCancelButton = true,
    this.showOkButton = true,
    required this.widthSize,
    required this.onPress,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: TextStyle(fontSize: widthSize * 0.055, color: titleColor, fontWeight: FontWeight.bold)),
      content: content,
      actions: <Widget>[
        showCancelButton ? TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              negativeButton,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
            )
        ) : Container(),
        showOkButton ? TextButton(
            onPressed: onPress,
            child: Text(
              positiveButton,
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            )
        ) : Container()
      ],
    );
  }
}