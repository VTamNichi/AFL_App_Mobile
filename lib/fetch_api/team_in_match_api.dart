import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/controllers/team_in_match_controller.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListTeamInMatch.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class TeamInMatchAPI {
  static Future<int> getListTeamInMatch(int tournamentId) async {
    final teamInMatchController = GetX.Get.put(TeamInMatchController());
    int rs = 0;
    try {
      final response = await http.get(Uri.parse("https://afootballleague.ddns.net/api/v1/TeamInMatch?tournamentId=" + tournamentId.toString()),
              headers: <String, String>{
                HttpHeaders.contentTypeHeader: 'application/json',
              });
      if(response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListTeamInMatch listTeamInMatch = ListTeamInMatch.fromJson(bodyJson);
        teamInMatchController.teamInMatchList.value = listTeamInMatch.teamsInMatch!;
      } else {
        teamInMatchController.teamInMatchList.value = [];
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}