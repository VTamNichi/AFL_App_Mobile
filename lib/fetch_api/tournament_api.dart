import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListTournament.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class TournamentAPI {
  static Future<int> getListTournament(
      String nameSearch,
      String areaSearch,
      String modeSearch,
      String typeSearch,
      String genderSearch,
      String footballFieldSearch,
      String orderBy,
      String orderType) async {
    final tournamentController = GetX.Get.put(TournamentController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse("https://afootballleague.ddns.net/api/v1/tournaments?" +
              nameSearch +
              areaSearch +
              modeSearch +
              typeSearch +
              genderSearch +
              footballFieldSearch +
              orderBy +
              orderType +
              "page-offset=1&limit=20"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListTournament listTournament = ListTournament.fromJson(bodyJson);
        tournamentController.tournamentList.value = listTournament.tournaments!;
        tournamentController.countListTournament.value =
            listTournament.countList!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
