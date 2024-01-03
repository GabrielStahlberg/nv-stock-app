import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nv_stock_app/route_generator.dart';
import 'package:nv_stock_app/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const NvStockApp());
}

class NvStockApp extends StatefulWidget {
  const NvStockApp({super.key});

  @override
  State<NvStockApp> createState() => _NvStockAppState();
}

class _NvStockAppState extends State<NvStockApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}