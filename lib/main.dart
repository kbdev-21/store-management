import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_management/features/home/home_binding.dart';
import 'package:shop_management/features/home/home_view.dart';
import 'package:shop_management/features/inventory/inventory_binding.dart';
import 'package:shop_management/features/inventory/inventory_page.dart';
import 'package:shop_management/features/navigator/navigator_binding.dart';
import 'package:shop_management/features/navigator/navigator_view.dart';
import 'package:shop_management/features/product/product_binding.dart';
import 'package:shop_management/features/product/product_page.dart';
import 'package:shop_management/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/navigator',
      getPages: [
        GetPage(
          name: '/navigator',
          page: () => NavigatorView(),
          binding: NavigatorBinding(),
        ),
        GetPage(
          name: '/home',
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: '/inventory',
          page: () => InventoryPage(),
          binding: InventoryBinding(),
        ),
        GetPage(
          name: '/product',
          page: () => ProductPage(),
          binding: ProductBinding()
        )
        // Add other routes here
      ],
    );
  }
}
