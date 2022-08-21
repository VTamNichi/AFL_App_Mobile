import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_match_controller.dart';
import 'package:amateur_football_league_mobile/models/Match.dart';
import 'package:amateur_football_league_mobile/models/TeamInMatch.dart';
import 'package:amateur_football_league_mobile/models/TeamInTournament.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class TeamInMatchAPI {
  static Future<int> getListTeamInMatch(int tournamentId) async {
    final teamInMatchController = GetX.Get.put(TeamInMatchController());
    final matchController = GetX.Get.put(MatchController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(
              urlApi + "TeamInMatch?tournamentId=" + tournamentId.toString()),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        TeamInMatch teamInMatch;
        teamInMatchController.teamInMatchList.value = [];
        teamInMatchController.circleMatch.value = 0;
        teamInMatchController.knockoutMatch.value = 0;
        bodyJson
            .map((tim) => {
                  teamInMatch = TeamInMatch(
                      id: tim["id"],
                      teamScore: tim["teamScore"],
                      yellowCardNumber: tim["yellowCardNumber"],
                      redCardNumber: tim["redCardNumber"],
                      teamInTournamentId: tim["teamInTournamentId"],
                      matchId: tim["matchId"],
                      result: tim["result"],
                      nextTeam: tim["nextTeam"],
                      teamName: tim["teamName"],
                      match: Match.fromJson(tim["match"]),
                      teamInTournament:
                          TeamInTournament.fromJson(tim["teamInTournament"])),
                  teamInMatchController.teamInMatchList.add(teamInMatch)
                })
            .toList();
        teamInMatchController.teamInMatchList
            .map((element) => {
                  if (element.match!.round == "Vòng bảng")
                    {teamInMatchController.circleMatch.value++}
                  else
                    {teamInMatchController.knockoutMatch.value++}
                })
            .toList();
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
