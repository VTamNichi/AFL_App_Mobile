import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListTeam.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class TeamAPI {
  static Future<int> getListTeam(String name, String teamArea,
      String teamGender, String orderBy, String orderType, int currentTeamPage) async {
    final teamController = GetX.Get.put(TeamController());
    int rs = 0;
    try {
      if(currentTeamPage == 0) {
        currentTeamPage = 1;
      }
      final response = await http.get(
          Uri.parse(urlApi +
              "teams?" +
              "team-name=" + name + "&" +
              teamArea +
              teamGender +
              orderBy +
              orderBy +
              "page-offset="+ currentTeamPage.toString() +"&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListTeam listTeam = ListTeam.fromJson(bodyJson);
        if(currentTeamPage > 1) {
          teamController.teamList.addAll(listTeam.teams!);
        }
        else {
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
}
