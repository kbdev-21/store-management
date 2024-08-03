import 'dart:convert';

import 'package:shop_management/models/customer.dart';
import 'package:http/http.dart' as http;

class CustomerRepo {
   Future<List<Customer>> getAllCustomer() async {
    final url =
        Uri.parse('http://localhost:3000/users/customers');

    final res = await http.get(url);

    if (res.statusCode == 200) {
      final Map<String, dynamic> resDecoded = json.decode(res.body);

      final List<dynamic> data = resDecoded['customers'];
      return data.map((customer) => Customer.fromJson(customer)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
   }
}