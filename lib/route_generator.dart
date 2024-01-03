import 'package:flutter/material.dart';
import 'package:nv_stock_app/screens/clothes/add/add_clothes_screen.dart';
import 'package:nv_stock_app/screens/home/home_screen.dart';

class RouteGenerator {
  static const String HOME_ROUTE = "/home_screen";
  static const String ADD_CLOTHES_ROUTE = "/add_clothes_screen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) => const HomeScreen()
        );
      case HOME_ROUTE:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen()
        );
      case ADD_CLOTHES_ROUTE:
        return MaterialPageRoute(
            builder: (_) => const AddClothesScreen()
        );
      default:
        return _routeError();
    }
  }

  static Route<dynamic> _routeError() {
    return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(title: const Text("Screen Not Found!"),),
            body: const Center(
              child: Text("Screen Not Found!"),
            ),
          );
        }
    );
  }
}