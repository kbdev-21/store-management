import 'package:get/get.dart';
import 'package:shop_management/features/home/home_controller.dart';
import 'package:shop_management/features/navigator/navigator_controller.dart';

class NavigatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigatorController>(() => NavigatorController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}