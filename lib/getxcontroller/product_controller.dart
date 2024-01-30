import 'package:get/get.dart';
import 'package:nv_stock_app/models/product.dart';

class ProductController extends GetxController {

  final List<Product> _storageMock = [
    Product(imageUrl: "", description: "Camisa Social 1", size: "1", position: "A", price: 149.99, category: "Camisas Sociais"),
    Product(imageUrl: "", description: "Camisa Social 2", size: "GG", position: "A", price: 159.99, category: "Camisas Sociais"),
    Product(imageUrl: "", description: "Camiseta 1", size: "P", position: "B", price: 79.99, category: "Camisetas"),
    Product(imageUrl: "", description: "Camiseta 2", size: "M", position: "B", price: 49.99, category: "Camisetas"),
    Product(imageUrl: "", description: "Costume 1", size: "50", position: "C", price: 799.99, category: "Costumes"),
  ];

  final List<Product> _products = <Product>[].obs;
  List<Product> get products => _products;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  findByCategory(String category) {
    //Mock Back-end
    _products.clear();
    _products.addAll(_storageMock.where((p) => p.category == category));
  }

  addProduct(Product product) {
    _isLoading.value = true;

    // Should call API here

    _products.add(product);

    _isLoading.value = false;
  }

}