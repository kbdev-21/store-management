//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_management/features/order/order_controller.dart';

class OrderPage extends GetWidget<OrderController> {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (_) {
      return Scaffold(
        appBar: _appBar(),
        body: DataTable(
            showCheckboxColumn: false,
            dataRowMaxHeight: 50,
            columnSpacing: 100,
            columns: _columns(),
            rows: _rows()),
      );
    });
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          controller: controller.searchController,
          decoration: InputDecoration(
            hintText: 'Search countries...',
            hintStyle: TextStyle(color: Colors.black),
            filled: true,
            fillColor: Colors.white24,
            prefixIcon: Icon(Icons.search, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          ),
          style: TextStyle(color: Colors.black),
          onChanged: (value) {
            controller.searchCountries(value);
          },
        ),
      ),
    );
  }

  List<DataRow> _rows() {
    return controller.orders.map((order) {
      return DataRow(
        cells: <DataCell>[
          //DataCell(Text(product.isActive! ? 'Active' : 'Inactive')),
          DataCell(Text(order.customerName!)),
          DataCell(Center(child: Text(order.totalprice!.toString()))),
          DataCell(Center(child: Text(order.quantity!.toString()))),
          DataCell(Center(child: Text(order.date!.toString()))),
          DataCell(Center(child: Text(order.status!.toString())))
        ],
      );
    }).toList();
  }

  List<DataColumn> _columns() {
    return [
      _label('Customer Name'),
      _label('Total Price'),
      _label('Quantity'),
      _label('Date'),
      _label('Status')
    ];
  }

  DataColumn _label(String title) {
    return DataColumn(
      label: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
