import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;
import 'package:amateur_football_league_mobile/models/general_models/Province';

class GeneralAPI {
  static Future<int> getListProvince() async {
    final generalController = GetX.Get.put(GeneralController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse("https://provinces.open-api.vn/api/?depth=3"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var list = json.decode(utf8.decode(response.bodyBytes)) as List<dynamic>;
        generalController.listProvince.value = list.map((e) => Province.fromJson(e)).toList();
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
