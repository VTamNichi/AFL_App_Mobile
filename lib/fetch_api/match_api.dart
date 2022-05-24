import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/controllers/match_controller.dart';
import 'package:amateur_football_league_mobile/models/Match.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class MatchAPI {
  static Future<int> createTokenMatch(int matchId) async {
    final matchController = GetX.Get.put(MatchController());
    int rs = 0;
    try {
      final response = await http.put(Uri.parse("https://afootballleague.ddns.net/api/v1/matchs?match-id="+ matchId.toString() +"&create-token=c"),
              headers: <String, String>{
                HttpHeaders.contentTypeHeader: 'application/json',
              });
      if(response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        Match match = Match.fromJson(bodyJson);
        matchController.matchDetail.value = match;
      } 
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
  static Future<int> getTokenMatch(int matchId) async {
    final matchController = GetX.Get.put(MatchController());
    int rs = 0;
    try {
      final response = await http.get(Uri.parse("https://afootballleague.ddns.net/api/v1/matchs/" + matchId.toString()),
              headers: <String, String>{
                HttpHeaders.contentTypeHeader: 'application/json',
              });
      if(response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        Match match = Match.fromJson(bodyJson);
        matchController.matchDetail.value = match;
      } 
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
