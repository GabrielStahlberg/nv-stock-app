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
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          flexibleSpace: TabBar(
            isScrollable: true,
            indicatorWeight: 5,
            indicatorColor: kSecondColor,
            controller: _tabController,
            tabs: [
              Tab(child: Text("Camisas socais", style: TextStyle(color: Colors.white, fontSize: widthSize * 0.045))),
              Tab(child: Text("Camisetas", style: TextStyle(color: Colors.white, fontSize: widthSize * 0.045))),
              Tab(child: Text("Costumes", style: TextStyle(color: Colors.white, fontSize: widthSize * 0.045))),
              Tab(child: Text("Moda feminina", style: TextStyle(color: Colors.white, fontSize: widthSize * 0.045))),
              Tab(child: Text("Gravatas", style: TextStyle(color: Colors.white, fontSize: widthSize * 0.045))),
              Tab(child: Text("Sapatos", style: TextStyle(color: Colors.white, fontSize: widthSize * 0.045))),
              Tab(child: Text("Cintos", style: TextStyle(color: Colors.white, fontSize: widthSize * 0.045))),
              Tab(child: Text("Carteiras", style: TextStyle(color: Colors.white, fontSize: widthSize * 0.045))),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget> [
            ClothesTabs(tabName: "Camisas socais"),
            ClothesTabs(tabName: "Camisetas"),
            ClothesTabs(tabName: "Costumes"),
            ClothesTabs(tabName: "Moda feminina"),
            ClothesTabs(tabName: "Gravatas"),
            ClothesTabs(tabName: "Sapatos"),
            ClothesTabs(tabName: "Cintos"),
            ClothesTabs(tabName: "Carteiras")
          ],
        ),
      ),
    );
  }
}
