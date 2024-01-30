import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:nv_stock_app/constants.dart';
import 'package:nv_stock_app/getxcontroller/product_controller.dart';
import 'package:nv_stock_app/nv_stock_utils.dart';

import 'actions/filter_action.dart';
import 'actions/print_action.dart';

class AccessoriesTabs extends StatefulWidget {
  final String tabName;

  const AccessoriesTabs({super.key, required this.tabName});

  @override
  State<AccessoriesTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<AccessoriesTabs> {
  final ProductController _productController = Get.find(tag: "ProductController");

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) {
      _productController.findByCategory(widget.tabName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        actions: const [FilterAction(), PrintAction()],
      ),
      body: Obx(() {
        return _productController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
            padding: EdgeInsets.only(top: widthSize * 0.02, bottom: widthSize * 0.02),
            itemCount: _productController.products.length,
            itemBuilder: (context, index) {
              var product = _productController.products[index];
              return Padding(
                padding: EdgeInsets.only(
                    left: widthSize * 0.02,
                    right: widthSize * 0.02,
                    bottom: widthSize * 0.02),
                child: Column(
                  children: [
                    SizedBox(
                      height: widthSize,
                      width: widthSize,
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.edit)
                                ),
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.delete)
                                ),
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.print)
                                ),
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(Icons.add_shopping_cart)
                                ),
                              ],
                            ),
                            SizedBox(
                              height: widthSize * 0.5,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                  scrollDirection:
                                  Axis.horizontal,
                                ),
                                items: getImageSliders(),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: widthSize * 0.04, right: widthSize * 0.04, top: widthSize * 0.05),
                              child: DefaultTextStyle(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium!,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.description!,
                                      style: TextStyle(fontSize: widthSize * 0.055),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(left: widthSize * 0.04, right: widthSize * 0.04, bottom: widthSize * 0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  NvStockUtils.getCardIndicator(widthSize, "Prat: ${product.position!}", Colors.brown),
                                  NvStockUtils.getCardIndicator(widthSize, "R\$ ${product.price!}", Colors.green),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
        );
      }),
    );
  }

  List<Widget> getImageSliders() {
    List<dynamic> list = List.empty(growable: true);
    list.add("assets/camisa1.PNG");

    return list
        .map((item) => Container(
      margin: const EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(item, fit: BoxFit.fill, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(),
              ),
            ],
          )),
    )).toList();
  }
}
