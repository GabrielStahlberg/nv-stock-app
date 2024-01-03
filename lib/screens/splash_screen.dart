import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nv_stock_app/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(const Duration(seconds: 5), (){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black
        ),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Image.asset("assets/NV.PNG"),
        ),
      ),
    );
  }
}