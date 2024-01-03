import 'package:flutter/material.dart';
import 'package:nv_stock_app/constants.dart';
import 'package:nv_stock_app/route_generator.dart';
import 'package:nv_stock_app/screens/clothes/clothes_screen.dart';
import 'package:nv_stock_app/screens/home/qr_code_action.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nelson Vestuário", style: TextStyle(color: Colors.white)),
        backgroundColor: kPrimaryColor,
        actions: const [QrCodeAction()],
      ),
      body: const ClothesScreen(),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: kSecondColor,
        onPressed: () => Navigator.pushNamed(context, RouteGenerator.ADD_CLOTHES_ROUTE),
        child: const Icon(Icons.add)
      ),
    );
  }
}
