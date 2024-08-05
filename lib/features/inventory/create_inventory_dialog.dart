//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_state_manager/src/simple/get_state.dart';
//import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:shop_management/features/inventory/inventory_controller.dart';

class CreateInventoryDialog extends GetWidget<InventoryController> {
  const CreateInventoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InventoryController>(builder: (controller) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: controller.descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: controller.priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: controller.imgUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.onSaveButtonClick,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
