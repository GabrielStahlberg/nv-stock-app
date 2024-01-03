import 'package:flutter/material.dart';
import 'package:nv_stock_app/constants.dart';
import 'package:nv_stock_app/screens/clothes/tabs/clothes_tabs.dart';

class ClothesScreen extends StatefulWidget {
  const ClothesScreen({super.key});

  @override
  State<ClothesScreen> createState() => _ClothesScreenState();
}

class _ClothesScreenState extends State<ClothesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          flexibleSpace: TabBar(
            indicatorWeight: 5,
            indicatorColor: kSecondColor,
            controller: _tabController,
            tabs: const [
              Tab(child: Text("Camisas", style: TextStyle(color: Colors.white))),
              Tab(child: Text("Camisetas", style: TextStyle(color: Colors.white))),
              Tab(child: Text("Sapatos", style: TextStyle(color: Colors.white)))
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget> [
            ClothesTabs(tabName: "Camisas"),
            ClothesTabs(tabName: "Camisetas"),
            ClothesTabs(tabName: "Camisetas")
          ],
        ),
      ),
    );
  }
}
