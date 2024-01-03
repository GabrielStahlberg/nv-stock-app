import 'package:flutter/material.dart';
import 'package:nv_stock_app/constants.dart';

class RoundedButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final Color color, textColor;
  final double widthSize, heightSize;

  const RoundedButtonPrimary(
      {Key? key,
        this.color = kPrimaryColor,
        this.textColor = Colors.white,
        this.heightSize = 0.14,
        required this.widthSize,
        required this.text,
        required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widthSize,
      height: widthSize * heightSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextButton(
          style:
          TextButton.styleFrom(foregroundColor: textColor, backgroundColor: color),
          onPressed: press,
          child: Text(text,
              style: TextStyle(
                  fontSize: widthSize * 0.045, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}