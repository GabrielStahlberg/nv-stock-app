import 'package:flutter/material.dart';
import 'package:nv_stock_app/constants.dart';
import 'package:nv_stock_app/route_generator.dart';
import 'package:nv_stock_app/screens/home/qr_code_action.dart';
import 'package:nv_stock_app/screens/home/shopping_cart_action.dart';
import 'package:nv_stock_app/screens/products/products_screen.dart';

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
        actions: const [ShoppingCartAction(), QrCodeAction()],
      ),
      body: const ProductsScreen(),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: kSecondColor,
        onPressed: () => Navigator.pushNamed(context, RouteGenerator.ADD_CLOTHES_ROUTE),
        child: const Icon(Icons.add)
      ),
    );
  }
}
