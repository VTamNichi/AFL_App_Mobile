import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/image_controller.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListImage.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class ImagesAPI {
  static Future<int> getListImages(int tournamentId, int currentImagesPage) async {
    final imagesController = GetX.Get.put(ImagesController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi +
              "images?" +
              "tournament-id=" +
              tournamentId.toString() +
              "&status=true&" +
              "order-type=DESC&" +
              "page-offset=" +
              currentImagesPage.toString() +
              "&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListImage listImages = ListImage.fromJson(bodyJson);
        if (currentImagesPage > 1) {
          imagesController.imagesList.addAll(listImages.images!);
        } else {
          imagesController.imagesList.value = listImages.images!;
        }
        imagesController.countListImages.value = listImages.countList!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
