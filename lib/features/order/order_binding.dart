import 'package:get/get.dart';
//import 'package:shop_management/features/home/home_controller.dart';
import 'package:shop_management/features/order/order_controller.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => OrderController());
  }
}
