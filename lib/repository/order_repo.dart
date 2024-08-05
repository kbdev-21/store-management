import 'dart:convert';
import 'package:shop_management/models/order.dart';
import 'package:http/http.dart' as http;

class OrderRepo {
  Future<List<Order>> getAllOrders() async {
    final url = Uri.parse('http://localhost:3000/orders/orders');

    final res = await http.get(url);

    if (res.statusCode == 200) {
      final Map<String, dynamic> resDecoded = json.decode(res.body);

      final List<dynamic> data = resDecoded['orders'];
      return data.map((orders) => Order.fromJson(orders)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }
}
