import 'package:get/get.dart';
import 'package:shop_management/features/inventory/inventory_controller.dart';
import 'package:shop_management/repository/product_repo.dart';

class InventoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InventoryController>(() => InventoryController());
  }
  
}