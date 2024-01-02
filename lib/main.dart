import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const NvStockApp());
}

class NvStockApp extends StatelessWidget {
  const NvStockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Container(),
        locale: Get.deviceLocale,
    );
  }
}