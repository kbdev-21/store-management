import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_management/features/navigator/navigator_controller.dart';

class NavigatorView extends GetWidget<NavigatorController> {
  const NavigatorView({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Row(
          children: [
            if (_width >= _height) _sideNavBar(),
            Expanded(
              child: Navigator(
                key: Get.nestedKey(1),
                initialRoute: '/home',
                onGenerateRoute: controller.onGenerateRoute,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Stack(
          children: [const SizedBox(), if (_width < _height) _bottomNavBar()],
        ));
  }

  Widget _bottomNavBar() {
    return Obx(
      () => BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: controller.currentIndex.value,
        selectedItemColor: Colors.blueAccent,
        onTap: controller.changePage,
      ),
    );
  }

  Widget _sideNavBar() {
    return Container(
      width: 120,
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Obx(
          () => ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _navItem(
                index: 0,
                icon: Icons.search,
                label: 'Browse',
              ),
              _navItem(
                index: 1,
                icon: Icons.inventory,
                label: 'Inventory',
              ),
              _navItem(
                index: 2,
                icon: Icons.settings,
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(
      {required int index, required IconData icon, required String label}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: controller.currentIndex.value == index
            ? Colors.blueAccent.withOpacity(0.5)
            : null,
        title: Column(
          children: [
            Icon(icon, size: 30),
            Text(label, style: TextStyle(fontSize: 14)),
          ],
        ),
        onTap: () {
          controller.changePage(index);
        },
      ),
    );
  }
}
