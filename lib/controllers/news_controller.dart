import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/news_api.dart';
import 'package:amateur_football_league_mobile/fetch_api/team_api.dart';
import 'package:amateur_football_league_mobile/models/News.dart';
import 'package:amateur_football_league_mobile/models/Team.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  final generalController = Get.put(GeneralController());

  RxList<News> newsList = <News>[].obs;
  RxInt countListNews = 0.obs;
  RxInt tournamentId = 0.obs;

  Future<void> getListNews({bool isRefresh = false}) async {
    generalController.isLoading.value = true;
    if (isRefresh) {
      generalController.currentNewsPage.value = 1;
    }

    await NewsAPI.getListNews(
        tournamentId.value, generalController.currentNewsPage.value);
    generalController.isLoading.value = false;
  }
}
