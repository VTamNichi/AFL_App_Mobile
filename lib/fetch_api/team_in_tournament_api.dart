import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/news_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_tournament_controller.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListTeamInTournament.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class TeamInTournamentAPI {
  static Future<int> getListTeamInTournament(int tournamentId) async {
    final teamInTournamentController =
        GetX.Get.put(TeamInTournamentController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi +
              "team-in-tournaments?" +
              "tournament-id=" +
              tournamentId.toString() +
              "&status=Tham gia&" +
              "order-by=Point&" +
              "order-type=DESC&" +
              "page-offset=1" +
              "&limit=16"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListTeamInTournament listTeamInTournament =
            ListTeamInTournament.fromJson(bodyJson);
        teamInTournamentController.teamInTournamentList.value =
            listTeamInTournament.teamInTournaments!;

        teamInTournamentController.teamInTournamentList.sort((a, b) => a.groupName!.compareTo(b.groupName!));
      }

      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
