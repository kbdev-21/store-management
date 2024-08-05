import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shop_management/features/home/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(appBar: appBar(), body: body());
    });
  }

  PreferredSizeWidget appBar() {
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

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 15, // Spacing between columns
          mainAxisSpacing: 15, // Spacing between rows
          childAspectRatio: 1.5, // Ratio of width to height for each item
        ),
        itemCount: controller.showCountries.length,
        itemBuilder: (context, index) {
          final country = controller.showCountries[index];
          return countryItem(name: country.name, flagUrl: country.flagUrl);
        },
      ),
    );
  }

  Widget countryItem({required String name, required String flagUrl}) {
    return GestureDetector(
      onTap: () {
        controller.countryClicked(name);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[400]!), // Border color
          borderRadius: BorderRadius.circular(10), // Border radius
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network(
              flagUrl,
              height: 80.0,
            ),
            SizedBox(height: 8),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
