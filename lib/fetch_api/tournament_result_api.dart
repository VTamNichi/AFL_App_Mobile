import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_result_controller.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListTournamentResult.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class TournamentResultsAPI {
  static Future<int> getListTournamentResults(int tournamentId) async {
    final tournamentResultsController =
        GetX.Get.put(TournamentResultsController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi +
              "tournament-results?" +
              "tournamentId=" +
              tournamentId.toString() +
              "&page-offset=1" +
              "&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListTournamentResult listTournamentResults =
            ListTournamentResult.fromJson(bodyJson);
        tournamentResultsController.tournamentResultsList.value =
            listTournamentResults.tournamentResults!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
