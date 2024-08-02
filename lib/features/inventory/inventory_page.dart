import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_management/features/inventory/create_inventory_dialog.dart';
import 'package:shop_management/features/inventory/inventory_controller.dart';

class InventoryPage extends GetWidget<InventoryController> {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryController>(builder: (_) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: controller.onAddButtonClick,
            child: Icon(Icons.delete),
          ),
          appBar: _appBar(),
          body: DataTable(showCheckboxColumn: false, dataRowMaxHeight: 50, columnSpacing: 20, columns: _columns(), rows: _rows()),
          );
    });
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Text('Item List'),
      leading: Icon(Icons.abc),
      actions: [Icon(Icons.abc), SizedBox(width: 20,), Icon(Icons.more), SizedBox(width: 20,)],
      //backgroundColor: (Colors.red),
    );
  }

  List<DataRow> _rows() {
    return controller.products.map((product) {
      return DataRow(
        onSelectChanged: (value) {
          controller.onProductClick(product.id!);
        },
        cells: <DataCell>[
          //DataCell(Text(product.isActive! ? 'Active' : 'Inactive')),
          DataCell(
            Image.network(
              product.imgUrl!,
              width: 40,
            ),
          ),
          DataCell(Text(product.name!)),
          DataCell(Center(child: Text(product.price!.toString()))),
          DataCell(Center(child: Text(product.quantity!.toString()))),
          DataCell(Center(child: Text(product.sold!.toString())))
        ],
      );
    }).toList();
  }

  List<DataColumn> _columns() {
    return [
      //_label('Status'),
      _label('Image'),
      _label('Product Name'),
      _label('Price'),
      _label('Stock'),
      _label('Sold')
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
