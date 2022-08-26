import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/football_player_controller.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListFootballPlayer.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListPlayerInTeam.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListTournament.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListTournamentResult.dart';
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
      if (orderBy.isEmpty) {
        orderBy = "order-by=Id&";
        orderType = "order-type=DESC&";
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
              "status=true&" +
              orderBy +
              orderType +
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

  static Future<int> getTeamJoining(int fpId) async {
    final footballPlayerController = GetX.Get.put(FootballPlayerController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi +
              "PlayerInTeam?footballPlayerId=" +
              fpId.toString() +
              "&status=true&orderType=DESC&pageIndex=1&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));

        ListPlayerInTeam listPlayerInTeam = ListPlayerInTeam.fromJson(bodyJson);

        footballPlayerController.listTeamJoining.value =
            listPlayerInTeam.playerInTeamsFull!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }

  static Future<int> getTournamentJoining(int fpId) async {
    final footballPlayerController = GetX.Get.put(FootballPlayerController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi +
              "tournaments/FootballPlayerID?footballPlayerID=" +
              fpId.toString() +
              "&sort=DESC&pageIndex=1&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));

        ListTournament listTournament = ListTournament.fromJson(bodyJson);

        footballPlayerController.listTournamentJoining.value =
            listTournament.tournaments!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }

  static Future<int> getFootballPlayerAnalysis(int footballPlayerId) async {
    final footballPlayerController = GetX.Get.put(FootballPlayerController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi +
              "tournament-results?footballPlayerId=" +
              footballPlayerId.toString() +
              "&page-offset=1&limit=16"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      footballPlayerController.champion.value = 0;
      footballPlayerController.second.value = 0;
      footballPlayerController.third.value = 0;
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListTournamentResult listTournamentResult =
            ListTournamentResult.fromJson(bodyJson);
        listTournamentResult.tournamentResults!
            .map((e) => {
                  if (e.prize == "Champion")
                    {
                      footballPlayerController.champion.value++,
                    }
                  else if (e.prize == "second")
                    {
                      footballPlayerController.second.value++,
                    }
                  else if (e.prize == "Top Goal")
                    {
                      footballPlayerController.topGoal.value++,
                    }
                  else
                    {footballPlayerController.third.value++}
                })
            .toList();
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }

  static Future<int> getScheduleToday(int footballPlayerId) async {
    final footballPlayerController = GetX.Get.put(FootballPlayerController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi +
              "matchs/TournamentID?footballPlayerID=" +
              footballPlayerId.toString()),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
