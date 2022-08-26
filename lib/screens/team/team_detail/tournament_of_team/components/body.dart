import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/player_in_team_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_tournament_controller.dart';
import 'package:amateur_football_league_mobile/screens/team/team_detail/player_in_team/components/build_player_in_team_list.dart';
import 'package:amateur_football_league_mobile/screens/team/team_detail/tournament_of_team/components/build_tournament_of_team_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final teamInTournamentController = Get.put(TeamInTournamentController());
  final generalController = Get.put(GeneralController());

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getTournamentOfTeamData({bool isRefresh = false}) async {
    if (!isRefresh) {
      if (generalController.currentTournamentOfTeamPage.value >=
          (teamInTournamentController.countListTournamentOfTeam.value / 8)
              .ceil()) {
        refreshController.loadNoData();
        return true;
      } else {
        generalController.currentTournamentOfTeamPage.value += 1;
      }
    }
    await teamInTournamentController.getListTournamentOfTeam(
        isRefresh: isRefresh);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: size.height - 90,
            child: SmartRefresher(
              controller: refreshController,
              enablePullUp: true,
              onRefresh: () async {
                final result = await getTournamentOfTeamData(isRefresh: true);
                if (result) {
                  refreshController.refreshCompleted();
                } else {
                  refreshController.refreshFailed();
                }
              },
              onLoading: () async {
                final result = await getTournamentOfTeamData(isRefresh: false);
                if (result) {
                  refreshController.loadComplete();
                } else {
                  refreshController.loadFailed();
                }
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:
                    teamInTournamentController.tournamentOfTeamList.length,
                itemBuilder: (BuildContext context, index) {
                  return teamInTournamentController
                              .tournamentOfTeamList[index].tournament ==
                          null
                      ? Container()
                      : BuildTournamentOfTeamList(
                          image: teamInTournamentController
                              .tournamentOfTeamList[index]
                              .tournament!
                              .tournamentAvatar,
                          name: teamInTournamentController
                              .tournamentOfTeamList[index]
                              .tournament!
                              .tournamentName,
                          gender: teamInTournamentController
                                      .tournamentOfTeamList[index]
                                      .tournament!
                                      .tournamentGender ==
                                  "Female"
                              ? "Nữ"
                              : "Nam",
                          type: teamInTournamentController
                                      .tournamentOfTeamList[index]
                                      .tournament!
                                      .tournamentTypeId ==
                                  1
                              ? "Loại trực tiếp"
                              : teamInTournamentController
                                          .tournamentOfTeamList[index]
                                          .tournament!
                                          .tournamentTypeId ==
                                      2
                                  ? "Đấu vòng tròn"
                                  : "Chia bảng",
                          area: teamInTournamentController
                              .tournamentOfTeamList[index]
                              .tournament!
                              .footballFieldAddress,
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
