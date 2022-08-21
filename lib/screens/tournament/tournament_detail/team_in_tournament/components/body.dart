import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/comment_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/news_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_tournament_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/team/components/build_team_list.dart';
import 'package:amateur_football_league_mobile/screens/team/team_detail/team_detail_screen.dart';
import 'package:amateur_football_league_mobile/screens/tournament/tournament_detail/news/components/build_news_list.dart';
import 'package:amateur_football_league_mobile/screens/tournament/tournament_detail/team_in_tournament/components/team_in_tournament_list.dart';
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

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: size.height - 90,
            child: teamInTournamentController.teamInTournamentList.isEmpty
                ? const Center(
                    child: Text(
                      "Giải đấu chưa đội thi đấu",
                      style: TextStyle(fontSize: 22),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        const BuildTeamInTournamentList(
                          image: "",
                          name: "Tên đội",
                          point: "Đ",
                          diffPoint: "HS",
                          win: "T",
                          draw: "H",
                          lose: "B",
                          title: "a",
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: teamInTournamentController
                              .teamInTournamentList.length,
                          itemBuilder: (BuildContext context, index) {
                            String groupName = teamInTournamentController
                                  .teamInTournamentList[index].groupName
                                      .toString();
                                if (index > 0 && teamInTournamentController
                                  .teamInTournamentList[index].groupName
                                      .toString() == teamInTournamentController
                                  .teamInTournamentList[index - 1].groupName
                                      .toString()) {
                                  groupName = "";
                                }
                            return Column(
                              children: [
                                groupName == "" ? Container() : Container(
                                      width: double.infinity,
                                      height: 50,
                                      color: kBlueBlack,
                                      child: Center(
                                        child: Text(
                                          groupName,
                                          style: TextStyle(
                                              color: kWhiteText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                BuildTeamInTournamentList(
                                  image: teamInTournamentController
                                      .teamInTournamentList[index].team!.teamAvatar,
                                  name: teamInTournamentController
                                      .teamInTournamentList[index].team!.teamName,
                                  point: teamInTournamentController
                                      .teamInTournamentList[index].point,
                                  diffPoint: teamInTournamentController
                                      .teamInTournamentList[index].differentPoint,
                                  win: teamInTournamentController
                                      .teamInTournamentList[index].numberOfWin,
                                  draw: teamInTournamentController
                                      .teamInTournamentList[index].numberOfDraw,
                                  lose: teamInTournamentController
                                      .teamInTournamentList[index].numberOfLose,
                                  title: "",
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
