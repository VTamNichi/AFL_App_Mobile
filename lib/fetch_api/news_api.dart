import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/news_controller.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListNews.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class NewsAPI {
  static Future<int> getListNews(int tournamentId, int currentNewsPage) async {
    final newsController = GetX.Get.put(NewsController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi +
              "news?" +
              "tournament-id=" +
              tournamentId.toString() +
              "&order-by=Id&" +
              "order-type=DESC&" +
              "page-offset=" +
              currentNewsPage.toString() +
              "&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListNews listNews = ListNews.fromJson(bodyJson);
        if (currentNewsPage > 1) {
          newsController.newsList.addAll(listNews.news!);
        } else {
          newsController.newsList.value = listNews.news!;
        }
        newsController.countListNews.value = listNews.countList!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
