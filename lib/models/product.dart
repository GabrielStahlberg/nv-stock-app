import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

class Product {
  String? imageUrl = "";
  String? description = "";
  String? size = "";
  String? position = "";
  double? price = 0.0;
  String? category = "";

  Product({this.imageUrl, this.description, this.size, this.position, this.price, this.category});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      imageUrl: json["imageUrl"],
      description: json["description"],
      size: json["size"],
      position: json["position"],
      price: json["price"],
      category: json["category"]
  );
}