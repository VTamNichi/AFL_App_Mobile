import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/match_detail_controller.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListMatchDetail.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListTeam.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class MatchDetailAPI {
  static Future<int> getListMatchDetail(int matchId) async {
    final matchDetailController = GetX.Get.put(MatchDetailController());
    int rs = 0;
    try {
      final response = await http.get(
          Uri.parse(urlApi + "MatchDetail/MatchId?matchId=" + matchId.toString()),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListMatchDetail listMatchDetail = ListMatchDetail.fromJson(bodyJson);
        matchDetailController.matchDetailList.value = listMatchDetail.matchDetails!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
