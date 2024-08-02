import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_management/features/home/home_binding.dart';
import 'package:shop_management/features/home/home_view.dart';
import 'package:shop_management/features/inventory/inventory_binding.dart';
import 'package:shop_management/features/inventory/inventory_page.dart';

class NavigatorController extends GetxController {
  static NavigatorController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/home', '/inventory', '/home'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.offNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home') {
      return GetPageRoute(
        settings: settings,
        page: () => HomeView(),
        binding: HomeBinding(),
        transition: Transition.noTransition,
      );
    }
    if (settings.name == '/inventory') {
      return GetPageRoute(
        settings: settings,
        page: () => InventoryPage(),
        binding: InventoryBinding(),
        transition: Transition.noTransition,
      );
    }
    return null;
  }
}
