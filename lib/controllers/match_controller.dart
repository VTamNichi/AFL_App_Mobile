import 'package:amateur_football_league_mobile/fetch_api/match_api.dart';
import 'package:amateur_football_league_mobile/models/Match.dart';
import 'package:amateur_football_league_mobile/screens/livestream/livestream_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class MatchController extends GetxController {
  RxInt matchId = 0.obs;
  Rx<Match> matchDetail = Match().obs;

  Future<int> createToken(int matchId) async {
    int rs = 0;
    await MatchAPI.createTokenMatch(matchId).then((value) => rs = value);
    return rs;
  }
  Future<int> getToken(int matchId) async {
    int rs = 0;
    await MatchAPI.getTokenMatch(matchId).then((value) => rs = value);
    return rs;
  }

  Future<void> onJoin(
      {bool isLivestream = false, required BuildContext context}) async {
    await [Permission.camera, Permission.microphone].request();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LivestreamScreen(
          isLivestream: isLivestream,
        ),
      ),
    );
  }
}
