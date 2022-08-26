import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/football_player_api.dart';
import 'package:amateur_football_league_mobile/models/FootballPlayer.dart';
import 'package:amateur_football_league_mobile/models/PlayerInTeamsFull.dart';
import 'package:amateur_football_league_mobile/models/Tournament.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class FootballPlayerController extends GetxController {
  final generalController = Get.put(GeneralController());

  Rx<int> selectFootballPlayer = 1.obs;

  RxList<FootballPlayer> footballPlayerList = <FootballPlayer>[].obs;
  RxList<PlayerInTeamsFull> listTeamJoining = <PlayerInTeamsFull>[].obs;
  RxList<Tournament> listTournamentJoining = <Tournament>[].obs;
  RxInt champion = 0.obs;
  RxInt second = 0.obs;
  RxInt third = 0.obs;
  RxInt topGoal = 0.obs;

  RxInt countListFootballPlayer = 0.obs;
  Rx<FootballPlayer> footballPlayerDetail = FootballPlayer().obs;
  RxList listFootballPlayerDetail = [
    "Đội bóng tham gia",
    "Giải đấu tham gia",
   // "Lịch thi đấu hôm nay",
    "Thành tích"
  ].obs;

  RxList listSearchFootballPlayer = ["Giới tính", "Vị trí"].obs;

  RxString sortFootballPlayerType = "".obs;
  RxString sortFootballPlayerBy = "".obs;
  //RxBool sortType = true.obs;
  //RxBool sortNameType = true.obs;

  RxString nameSearchFootballPlayer = "".obs;
  RxString genderSearchFootballPlayer = "".obs;
  RxString positionSearchFootballPlayer = "".obs;

  Future<void> getListFootballPlayer({bool isRefresh = false}) async {
    generalController.isLoading.value = true;
    if (isRefresh) {
      generalController.currentFootballPlayerPage.value = 1;
    }
    await FootballPlayerAPI.getListFootballPlayer(
        nameSearchFootballPlayer.value,
        genderSearchFootballPlayer.value,
        positionSearchFootballPlayer.value,
        sortFootballPlayerBy.value,
        sortFootballPlayerType.value,
        generalController.currentFootballPlayerPage.value);
    generalController.isLoading.value = false;
  }

  Future<void> getTeamJoining() async {
    generalController.isLoading.value = true;
    await FootballPlayerAPI.getTeamJoining(footballPlayerDetail.value.id!);
    generalController.isLoading.value = false;
  }

  Future<void> getTournamentJoining() async {
    generalController.isLoading.value = true;
    await FootballPlayerAPI.getTournamentJoining(
        footballPlayerDetail.value.id!);
    generalController.isLoading.value = false;
  }

  Future<void> getFootballPlayerAnalysis() async {
    generalController.isLoading.value = true;
    await FootballPlayerAPI.getFootballPlayerAnalysis(footballPlayerDetail.value.id!);
    generalController.isLoading.value = false;
  }

  Future<void> getScheduleToday() async {
    generalController.isLoading.value = true;
    await FootballPlayerAPI.getScheduleToday(footballPlayerDetail.value.id!);
    generalController.isLoading.value = false;
  }

  void showOptionOrderFootballPlayer(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
              height: 190,
              child: Column(children: <Widget>[
                Container(
                  height: 50,
                  width: double.infinity,
                  color: kGreenLightColor,
                  alignment: Alignment.center,
                  child: Text(
                    "Sắp xếp theo",
                    style: TextStyle(
                        color: kWhiteText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      // if (sortType.isTrue) {
                      //   sortTeamType.value = "order-type=ASC&";
                      // } else {
                      //   sortTeamType.value = "order-type=DESC&";
                      // }
                      // sortType.value = !sortType.value;
                      // sortTeamBy.value = "";
                      await getListFootballPlayer();
                    },
                    title: const Center(child: Text("--"))),
                Divider(color: kGreyColor, height: 3),
                // +
              ]));
        });
  }
}
