import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/player_in_team_controller.dart';
import 'package:amateur_football_league_mobile/screens/team/team_detail/player_in_team/components/build_player_in_team_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final playerInTeamController = Get.put(PlayerInTeamController());
  final generalController = Get.put(GeneralController());

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getPlayerInTeamData({bool isRefresh = false}) async {
    if (!isRefresh) {
      if (generalController.currentPlayerInTeamPage.value >=
          (playerInTeamController.countListPlayerInTeam.value / 8).ceil()) {
        refreshController.loadNoData();
        return true;
      } else {
        generalController.currentPlayerInTeamPage.value += 1;
      }
    }
    await playerInTeamController.getListPlayerInTeam(isRefresh: isRefresh);
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
            child: Stack(
              children: [
                playerInTeamController.playerInTeamList.isEmpty
                    ? const Center(
                        child: Text(
                          "Đội bóng chưa có cầu thủ",
                          style: TextStyle(fontSize: 22),
                        ),
                      )
                    : Container(),
                SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  onRefresh: () async {
                    final result = await getPlayerInTeamData(isRefresh: true);
                    if (result) {
                      refreshController.refreshCompleted();
                    } else {
                      refreshController.refreshFailed();
                    }
                  },
                  onLoading: () async {
                    final result = await getPlayerInTeamData(isRefresh: false);
                    if (result) {
                      refreshController.loadComplete();
                    } else {
                      refreshController.loadFailed();
                    }
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: playerInTeamController.playerInTeamList.length,
                    itemBuilder: (BuildContext context, index) {
                      return BuildPlayerInTeamList(
                        image: playerInTeamController.playerInTeamList[index]
                            .footballPlayer!.playerAvatar,
                        name: playerInTeamController
                            .playerInTeamList[index].footballPlayer!.playerName,
                        position: playerInTeamController.playerInTeamList[index]
                                    .footballPlayer!.position ==
                                "striker"
                            ? "Tiền đạo"
                            : playerInTeamController.playerInTeamList[index]
                                        .footballPlayer!.position ==
                                    "defender"
                                ? "Hậu vệ"
                                : playerInTeamController.playerInTeamList[index]
                                            .footballPlayer!.position ==
                                        "midfielder"
                                    ? "Tiền vệ"
                                    : "Thủ môn",
                        gender: playerInTeamController.playerInTeamList[index]
                                    .footballPlayer!.idNavigation!.gender ==
                                "Female"
                            ? "Nữ"
                            : "Nam",
                        area: playerInTeamController.playerInTeamList[index]
                            .footballPlayer!.idNavigation!.address,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
