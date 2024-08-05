import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_management/models/order.dart';
import 'package:shop_management/repository/order_repo.dart';

class OrderController extends GetxController {
  final OrderRepo _orderRepo = OrderRepo();

  final searchController = TextEditingController();

  List<Order> showOrders = [];
  List<Order> orders = [];
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getOrders();
  }

  Future<void> getOrders() async {
    try {
      orders = await _orderRepo.getAllOrders();
      update(); // Notify the reactive system
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }

  void searchCountries(String searchKey) {
    if (searchKey.isEmpty) {
      showOrders = orders;
    } else {
      showOrders = orders.where((order) {
        return (order.customerName
                ?.toLowerCase()
                .contains(searchKey.toLowerCase()) ??
            false);
      }).toList();
    }
    update();
  }
}
