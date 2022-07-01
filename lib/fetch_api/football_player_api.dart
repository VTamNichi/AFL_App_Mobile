import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/football_player_controller.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListFootballPlayer.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class FootballPlayerAPI {
  static Future<int> getListFootballPlayer(
      String name,
      String footballPlayerGender,
      String position,
      String orderBy,
      String orderType,
      int currentFootballPlayerPage) async {
    final footballPlayerController = GetX.Get.put(FootballPlayerController());
    int rs = 0;
    try {
      if (currentFootballPlayerPage == 0) {
        currentFootballPlayerPage = 1;
      }
      final response = await http.get(
          Uri.parse(urlApi +
              "football-players?" +
              "football-player-name=" +
              name +
              "&" +
              "gender=" +
              footballPlayerGender +
              "&" +
              footballPlayerGender +
              position +
              orderBy +
              orderBy +
              "page-offset=" +
              currentFootballPlayerPage.toString() +
              "&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListFootballPlayer listFootballPlayer =
            ListFootballPlayer.fromJson(bodyJson);
        if (currentFootballPlayerPage > 1) {
          footballPlayerController.footballPlayerList
              .addAll(listFootballPlayer.footballPlayers!);
        } else {
          footballPlayerController.footballPlayerList.value =
              listFootballPlayer.footballPlayers!;
        }
        footballPlayerController.countListFootballPlayer.value =
            listFootballPlayer.countList!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
