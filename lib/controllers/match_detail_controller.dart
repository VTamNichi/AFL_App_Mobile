import 'dart:convert';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/match_detail_api.dart';
import 'package:amateur_football_league_mobile/models/MatchDetail.dart';
import 'package:amateur_football_league_mobile/models/user_comment.dart';
import 'package:amateur_football_league_mobile/screens/livestream/livestream_screen.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import 'package:signalr_netcore/signalr_client.dart';

class MatchDetailController extends GetxController {
  final userController = Get.put(UserController());
  final teamInMachController = Get.put(TeamInMatchController());
  final tournamentController = Get.put(TournamentController());
  final matchController = Get.put(MatchController());
  final generalController = Get.put(GeneralController());

  RxList<UserComment> listCommentLive = <UserComment>[].obs;

  RxList<MatchDetail> matchDetailList = <MatchDetail>[].obs;
  HubConnection hubConnection = HubConnectionBuilder()
      .withUrl("https://afootballleague.ddns.net/chat")
      .build();

  Future<int> getListMatchDetail(int matchId) async {
    int rs = 0;
    await MatchDetailAPI.getListMatchDetail(matchId)
        .then((value) => rs = value);
    return rs;
  }

  void _handlerReceiveComment(List<Object>? args) {
    String user = args![0].toString();
    if (user.length > 20) {
      List<String> userAttribute = user.split(",");
      String username = userAttribute[1].split(":")[1];
      String avatar = userAttribute[2].replaceFirst("avatar: ", "");
      String comment = args[1].toString();
      listCommentLive
          .add(UserComment(username: username, avatar: avatar, room: comment));
    }
  }

  void _handlerMatchDetail(List<Object>? args) async {
    await teamInMachController
        .getListTeamInMatch(tournamentController.tournamentDetail.value.id!);
    await getListMatchDetail(matchController.matchDetail.value.id!);
    teamInMachController.teamInMatchList.map((element) {
      if (element.id == teamInMachController.teamInMatchDetail1.value.id) {
        teamInMachController.teamInMatchDetail1.value = element;
      }
      if (element.id == teamInMachController.teamInMatchDetail2.value.id) {
        teamInMachController.teamInMatchDetail2.value = element;
      }
    }).toList();
  }

  void _handlerReceiveScreen(List<Object>? args) async {
    matchController.idScreen.value = args![0].toString();
    if (matchController.hasChangeScreen.value && !matchController.isLive.value) {
      Get.back();
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.to(const LivestreamScreen(isLivestream: false));
      });
    }
  }

  Future<void> joinRoom(String room, bool start) async {
    try {
      if (start) {
        hubConnection.on("ReceiveComment", _handlerReceiveComment);
        hubConnection.on("MatchDetail", _handlerMatchDetail);
        hubConnection.on("ReceiveScreen", _handlerReceiveScreen);

        await hubConnection.start();
        String Id = userController.user.value.id.toString();
        String name = userController.user.value.username.toString();
        String avatar = userController.user.value.avatar.toString();
        String connectionId = "a";
        bool newGuest = false;

        UserComment user = UserComment(
            id: Id,
            username: name,
            avatar: avatar,
            room: room,
            connectionId: connectionId,
            newGuest: newGuest);

        await hubConnection.invoke("JoinStream", args: <Object>[user]);
      } else {
        hubConnection.stop();
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future<void> sendCommentLivestream(String comment) async {
    try {
      await hubConnection.invoke("sendComment", args: <Object>[comment]);
      // ignore: empty_catches
    } catch (e) {}
  }
}
