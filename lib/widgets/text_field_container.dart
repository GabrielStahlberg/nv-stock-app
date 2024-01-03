import 'package:flutter/material.dart';
import 'package:nv_stock_app/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final double widthSize;

  const TextFieldContainer({
    Key? key,
    required this.child,
    required this.widthSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widthSize * 0.05, vertical: widthSize * 0.015),
      width: widthSize,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}