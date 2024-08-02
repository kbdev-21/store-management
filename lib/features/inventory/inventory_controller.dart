import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_management/features/inventory/create_inventory_dialog.dart';
import 'package:shop_management/features/product/product_page.dart';
import 'package:shop_management/models/product.dart';
import 'package:shop_management/repository/product_repo.dart';

class InventoryController extends GetxController {
  final ProductRepo _productRepo = ProductRepo();

  List<Product> products = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imgUrlController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }
  void onAddButtonClick() {
    Get.dialog(CreateInventoryDialog());
  }
  void onSaveButtonClick() async {
    await addProduct();
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    imgUrlController.clear();
    Get.back();
  }
  void onProductClick(String productId) {
    Get.toNamed('/product', arguments: productId);
  }

  Future<void> getProducts() async {
    products = await _productRepo.getAllProducts();
    update();
  }

  Future<void> addProduct() async {
    Product product = Product(sold: 0, quantity: 0, isActive: true, price: int.parse(priceController.text), name: nameController.text, imgUrl: imgUrlController.text);

    await _productRepo.createProduct(product: product);

    getProducts();
  }

  
}
