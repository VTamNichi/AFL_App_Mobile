import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/player_in_team_controller.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListPlayerInTeam.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class PlayerInTeamAPI {
  static Future<int> getListPlayerInTeam(int teamId, int currentPlayerInTeamPage) async {
    final playerInTeamController = GetX.Get.put(PlayerInTeamController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi +
              "PlayerInTeam?" +
              "teamId=" +
              teamId.toString() +
              "&status=true&" +
              "pageIndex=" +
              currentPlayerInTeamPage.toString() +
              "&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListPlayerInTeam listPlayerInTeam = ListPlayerInTeam.fromJson(bodyJson);
        if (currentPlayerInTeamPage > 1) {
          playerInTeamController.playerInTeamList.addAll(listPlayerInTeam.playerInTeamsFull!);
        } else {
          playerInTeamController.playerInTeamList.value = listPlayerInTeam.playerInTeamsFull!;
        }
        playerInTeamController.countListPlayerInTeam.value = listPlayerInTeam.countList!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
