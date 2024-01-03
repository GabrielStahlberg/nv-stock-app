import 'package:flutter/material.dart';

class NvStockUtils {
  static getCardIndicator(double widthSize, String text, Color color) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
          padding: EdgeInsets.only(
              left: widthSize * 0.05,
              right: widthSize * 0.05,
              bottom: widthSize * 0.01,
              top: widthSize * 0.01),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: widthSize * 0.042,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}