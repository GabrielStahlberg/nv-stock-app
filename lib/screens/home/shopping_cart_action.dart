import 'package:flutter/material.dart';

class ShoppingCartAction extends StatefulWidget {
  const ShoppingCartAction({super.key});

  @override
  State<ShoppingCartAction> createState() => _ShoppingCartActionState();
}

class _ShoppingCartActionState extends State<ShoppingCartAction> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){

        },
        icon: const Icon(Icons.shopping_cart, color: Colors.white)
    );
  }
}
