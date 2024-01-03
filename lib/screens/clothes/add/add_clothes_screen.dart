import 'package:flutter/material.dart';
import 'package:nv_stock_app/constants.dart';

class AddClothesScreen extends StatefulWidget {
  const AddClothesScreen({super.key});

  @override
  State<AddClothesScreen> createState() => _AddClothesScreenState();
}

class _AddClothesScreenState extends State<AddClothesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kPrimaryColor,
        title: const Text("Adicionar item"),
      ),
    );
  }
}
