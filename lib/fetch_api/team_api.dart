import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/models/TeamAnalysis.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListTeam.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListTournamentResult.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class TeamAPI {
  static Future<int> getListTeam(
      String name,
      String teamArea,
      String teamGender,
      String orderBy,
      String orderType,
      int currentTeamPage) async {
    final teamController = GetX.Get.put(TeamController());
    int rs = 0;
    try {
      if (currentTeamPage == 0) {
        currentTeamPage = 1;
      }
      if (orderBy.isEmpty) {
        orderBy = "order-by=Id&";
        orderType = "order-type=DESC&";
      }
      final response = await http.get(
          Uri.parse(urlApi +
              "teams?" +
              "team-name=" +
              name +
              "&" +
              teamArea +
              teamGender +
              orderBy +
              orderType +
              "page-offset=" +
              currentTeamPage.toString() +
              "&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListTeam listTeam = ListTeam.fromJson(bodyJson);
        if (currentTeamPage > 1) {
          teamController.teamList.addAll(listTeam.teams!);
        } else {
          teamController.teamList.value = listTeam.teams!;
        }
        teamController.countListTeam.value = listTeam.countList!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }

  static Future<int> getTeamAnalysis(int teamId) async {
    final teamController = GetX.Get.put(TeamController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi + "TeamInMatch/Result?teamId=" + teamId.toString()),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        teamController.teamAnalysis.value = TeamAnalysis.fromJson(bodyJson);
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }

  static Future<int> getTeamAnalysis2(int teamId) async {
    final teamController = GetX.Get.put(TeamController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi +
              "tournament-results?teamId=" +
              teamId.toString() +
              "&page-offset=1&limit=16"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      teamController.champion.value = 0;
      teamController.second.value = 0;
      teamController.third.value = 0;
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListTournamentResult listTournamentResult =
            ListTournamentResult.fromJson(bodyJson);
        listTournamentResult.tournamentResults!
            .map((e) => {
                  if (e.prize == "Champion")
                    {
                      teamController.champion.value++,
                    }
                  else if (e.prize == "second")
                    {
                      teamController.second.value++,
                    }
                  else
                    {teamController.third.value++}
                })
            .toList();
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
