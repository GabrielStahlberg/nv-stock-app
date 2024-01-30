import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:nv_stock_app/constants.dart';
import 'package:nv_stock_app/getxcontroller/product_controller.dart';
import 'package:nv_stock_app/image_helper.dart';
import 'package:nv_stock_app/models/product.dart';
import 'package:nv_stock_app/nv_stock_utils.dart';
import 'package:nv_stock_app/widgets/rounded_button_primary.dart';
import 'package:nv_stock_app/widgets/rounded_input_field.dart';

class AddClothesScreen extends StatefulWidget {
  const AddClothesScreen({super.key});

  @override
  State<AddClothesScreen> createState() => _AddClothesScreenState();
}

class _AddClothesScreenState extends State<AddClothesScreen> {
  final ProductController _productController = Get.find(tag: "ProductController");

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _sizeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final MoneyMaskedTextController _priceController = MoneyMaskedTextController(decimalSeparator: ",", thousandSeparator: ".", leftSymbol: "R\$");
  final ImageHelper imageHelper = ImageHelper();

  List<File> _productImages = [];

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: kPrimaryColor,
        title: const Text("Adicionar Produto"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: widthSize * 0.02,
                right: widthSize * 0.02,
                bottom: widthSize * 0.02),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final files = await imageHelper.pickImages(multiple: true);
                    if(files.length > 3) {
                      const snackBar = SnackBar(
                        content: Text("Apenas 3 imagens são possíveis."),
                      );
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      setState(() =>
                      _productImages = files.map((e) => File(e.path)).toList());
                    }
                  },
                  child: SizedBox(
                    height: widthSize * 0.7,
                    child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal
                        ),
                        items: NvStockUtils.getImageSliders(_productImages, false)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: widthSize * 0.04),
                RoundedInputField(
                  controller: _descriptionController,
                  icon: Icons.label,
                  inputType: TextInputType.name,
                  hintText: "Descrição*",
                  widthSize: widthSize,
                  onChanged: null,
                  onTap: null,
                ),
                SizedBox(height: widthSize * 0.04),
                RoundedInputField(
                  controller: _sizeController,
                  icon: Icons.label,
                  inputType: TextInputType.name,
                  hintText: "Tamanho*",
                  widthSize: widthSize,
                  onChanged: null,
                  onTap: null,
                ),
                SizedBox(height: widthSize * 0.04),
                RoundedInputField(
                  controller: _positionController,
                  icon: Icons.label,
                  inputType: TextInputType.name,
                  hintText: "Posição*",
                  widthSize: widthSize,
                  onChanged: null,
                  onTap: null,
                ),
                SizedBox(height: widthSize * 0.04),
                RoundedInputField(
                  icon: Icons.category,
                  hintText: "Categoria*",
                  widthSize: widthSize,
                  readOnly: true,
                  controller: _categoryController,
                  onChanged: null,
                  onTap: () => NvStockUtils.showOptionsDialog(
                      context,
                      widthSize,
                      _categoryController,
                      "",
                      "Categoria",
                      NvStockUtils.getCategories()),
                ),
                SizedBox(height: widthSize * 0.04),
                RoundedInputField(
                  controller: _priceController,
                  icon: Icons.monetization_on,
                  inputType: TextInputType.number,
                  hintText: "R\$*",
                  widthSize: widthSize,
                  onChanged: null,
                  onTap: null,
                ),
                SizedBox(height: widthSize * 0.04),
                RoundedButtonPrimary(
                  text: "Adicionar",
                  widthSize: widthSize,
                  press: () => _addProduct(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _addProduct() {
    final product = Product(
      imageUrl: "",
      description: _descriptionController.text,
      size: _sizeController.text,
      position: _positionController.text,
      price: _priceController.numberValue,
      category: _categoryController.text
    );

    _productController.addProduct(product);
  }
}
