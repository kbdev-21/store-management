import 'package:get/get.dart';
import 'package:shop_management/models/product.dart';
import 'package:shop_management/repository/product_repo.dart';

class ProductController extends GetxController {
  final ProductRepo _productRepo = ProductRepo();
  
  String productId = Get.arguments;
  Product? product;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  Future<void> getProduct() async {
    product = await _productRepo.getProductById(productId);
    update();
  }
}