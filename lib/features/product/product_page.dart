import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shop_management/features/product/product_controller.dart';

class ProductPage extends GetWidget<ProductController> {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(controller.product?.name ?? ''),
        ),
      );
    },);
  }
}