import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/models/Tournament.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListTournament.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class TournamentAPI {
  static Future<int> getListTournament(
      String nameSearch,
      String userIDSearchTour,
      String areaSearch,
      String modeSearch,
      String typeSearch,
      String genderSearch,
      String footballFieldSearch,
      String orderBy,
      String orderType,
      int currentTournamentPage) async {
    final tournamentController = GetX.Get.put(TournamentController());
    int rs = 0;
    try {
      if (currentTournamentPage == 0) {
        currentTournamentPage = 1;
      }
      if (orderBy.isEmpty) {
        orderBy = "order-by=DateCreate&";
        orderType = "order-type=DESC&";
      }
      final response = await http.get(
          Uri.parse(urlApi +
              "tournaments?" +
              "tournament-name=" +
              nameSearch +
              "&" +
              userIDSearchTour +
              areaSearch +
              modeSearch +
              typeSearch +
              genderSearch +
              footballFieldSearch +
              "status=true&" +
              orderBy +
              orderType +
              "page-offset=" +
              currentTournamentPage.toString() +
              "&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });

      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListTournament listTournament = ListTournament.fromJson(bodyJson);
        if (currentTournamentPage > 1) {
          tournamentController.tournamentList
              .addAll(listTournament.tournaments!);
        } else {
          tournamentController.tournamentList.value =
              listTournament.tournaments!;
        }
        tournamentController.countListTournament.value =
            listTournament.countList!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }

  static Future<Tournament> getTournamentById(int tournamentId) async {
    Tournament tournament = Tournament();
    try {
      
      final response = await http
          .get(Uri.parse(urlApi + "tournaments/" + tournamentId.toString()), headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        tournament = Tournament.fromJson(bodyJson);
      }
    } catch (e) {
      return tournament;
    }
    return tournament;
  }
}
