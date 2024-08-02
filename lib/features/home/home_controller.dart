import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_management/models/country.dart';
import 'package:shop_management/repository/country_repo.dart';

class HomeController extends GetxController {
  final _countryRepo = CountryRepo();

  List<Country> allCountries = [];
  List<Country> showCountries = [];
  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getCountries();
  }

  void getCountries() async {
    allCountries = await _countryRepo.getAllCountriesAndFlags();
    showCountries = allCountries; // Initialize filteredCountries
    update();
  }

  void searchCountries(String searchKey) {
    if (searchKey.isEmpty) {
      showCountries = allCountries;
    } else {
      showCountries = allCountries.where((country) {
        return country.name.toLowerCase().contains(searchKey.toLowerCase());
      }).toList();
    }
    update();
  }

  void countryClicked(String name) async {
    String capital = await _countryRepo.getCapitalByCountryName(name);
    Get.defaultDialog(title: 'Country clicked', middleText: capital);
  }
}
