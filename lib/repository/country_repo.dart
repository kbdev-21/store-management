import 'package:shop_management/models/country.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryRepo {
  Future<List<Country>> getAllCountriesAndFlags() async {
    final url =
        Uri.parse('https://countriesnow.space/api/v0.1/countries/flag/images');

    final res = await http.get(url);

    if (res.statusCode == 200) {
      final Map<String, dynamic> resDecoded = json.decode(res.body);

      final List<dynamic> data = resDecoded['data'];
      return data.map((country) => Country.fromJson(country)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<String> getCapitalByCountryName(String name) async {
    final posUrl =
        Uri.parse('https://countriesnow.space/api/v0.1/countries/capital');
    final posReqBody = json.encode({"country": name});

    final posRes = await http.post(
      posUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: posReqBody,
    );

    if (posRes.statusCode == 200) {
      final Map<String, dynamic> resDecoded = json.decode(posRes.body);

      String capital = resDecoded['data']['capital'];
      return capital;

    } else {
      print('Request failed with status: ${posRes.statusCode}');
      return 'hey';
    }
  }
}
