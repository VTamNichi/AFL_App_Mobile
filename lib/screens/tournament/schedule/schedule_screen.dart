import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/match_detail_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/models/user_comment.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/tournament/schedule/components/list_match.dart';
import 'package:amateur_football_league_mobile/screens/tournament/schedule/match_detail/match_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final tournamentController = Get.put(TournamentController());
  final teamInMatchController = Get.put(TeamInMatchController());
  final matchController = Get.put(MatchController());
  final matchDetailController = Get.put(MatchDetailController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Obx(
        () => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "Lịch thi đấu",
                  style: TextStyle(
                    color: kBlackText,
                  ),
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: kBackgroundColor,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: kBlackText,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              backgroundColor: kBackgroundColor,
              body: Column(
                children: [
                  if (tournamentController
                          .tournamentDetail.value.tournamentTypeId ==
                      1) ...[
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(kPadding / 2, 0, kPadding / 2, 0),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: SvgPicture.asset(
                              'assets/images/knockout_check.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(
                            width: 135,
                            child: Text(
                              "Loại trực tiếp",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                            child: Text(
                              ".",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 135,
                            child: Text(
                              (teamInMatchController.teamInMatchList.length / 2)
                                      .toString()
                                      .replaceAll(".0", "") +
                                  " trận đấu",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else if (tournamentController
                          .tournamentDetail.value.tournamentTypeId ==
                      2) ...[
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(kPadding / 2, 0, kPadding / 2, 0),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: SvgPicture.asset(
                              'assets/images/circle_check.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(
                            width: 135,
                            child: Text(
                              "Đấu vòng tròn",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                            child: Text(
                              ".",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 135,
                            child: Text(
                              (teamInMatchController.teamInMatchList.length / 2)
                                      .toString()
                                      .replaceAll(".0", "") +
                                  " trận đấu",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(kPadding / 2, 0, kPadding / 2, 0),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: SvgPicture.asset(
                              'assets/images/circle_check.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(
                            width: 135,
                            child: Text(
                              "Đấu vòng tròn",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                            child: Text(
                              ".",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 135,
                            child: Text(
                              (teamInMatchController.circleMatch.value / 2)
                                      .toString()
                                      .replaceAll(".0", "") +
                                  " trận đấu",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.fromLTRB(kPadding / 2, 0, kPadding / 2, 0),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: SvgPicture.asset(
                              'assets/images/knockout_check.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(
                            width: 135,
                            child: Text(
                              "Loại trực tiếp",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                            child: Text(
                              ".",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 135,
                            child: Text(
                              (teamInMatchController.knockoutMatch.value / 2)
                                      .toString()
                                      .replaceAll(".0", "") +
                                  " trận đấu",
                              style: TextStyle(
                                color: kBlackText,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  Divider(
                    color: kGreyColor,
                    height: 1,
                  ),
                  SizedBox(
                    height: tournamentController
                          .tournamentDetail.value.tournamentTypeId ==
                      3 ? size.height - 191 : size.height - 141,
                    child: SingleChildScrollView(
                      child: teamInMatchController.teamInMatchList.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: (teamInMatchController
                                          .teamInMatchList.length /
                                      2)
                                  .round(),
                              itemBuilder: (BuildContext context, index) {
                                int flag = 0;
                                flag += 2 * index;
                                String groupName = teamInMatchController
                                      .teamInMatchList[flag].match!.groupFight
                                      .toString();
                                if (flag > 0 && teamInMatchController
                                      .teamInMatchList[flag].match!.groupFight
                                      .toString() == teamInMatchController
                                      .teamInMatchList[flag-1].match!.groupFight
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
                                    GestureDetector(
                                      onTap: () async {
                                        generalController.isLoading.value =
                                            true;
                                        matchController.matchId.value =
                                            teamInMatchController
                                                .teamInMatchList[flag].matchId!;
                                        teamInMatchController
                                                .teamInMatchDetail1.value =
                                            teamInMatchController
                                                .teamInMatchList[flag];
                                        teamInMatchController
                                                .teamInMatchDetail2.value =
                                            teamInMatchController
                                                .teamInMatchList[flag + 1];
                                        await matchController.getToken(
                                            matchController.matchId.value);
                                        await matchDetailController
                                            .getListMatchDetail(
                                                matchController.matchId.value);
                                        matchDetailController.listCommentLive
                                            .value = <UserComment>[];
                                        await matchDetailController.joinRoom(
                                            matchController.matchId.value
                                                .toString(),
                                            true);
                                        generalController.isLoading.value =
                                            false;
                                        Get.to(MatchDetailScreen());
                                      },
                                      child: ListMatch(
                                        name1: teamInMatchController
                                            .teamInMatchList[flag].teamName,
                                        image1: teamInMatchController
                                                    .teamInMatchList[flag]
                                                    .teamInTournamentId ==
                                                null
                                            ? ""
                                            : teamInMatchController
                                                .teamInMatchList[flag]
                                                .teamInTournament!
                                                .team!
                                                .teamAvatar,
                                        score1: teamInMatchController
                                                    .teamInMatchList[flag]
                                                    .teamScore
                                                    .toString() ==
                                                "null"
                                            ? 0
                                            : teamInMatchController
                                                .teamInMatchList[flag]
                                                .teamScore,
                                        name2: teamInMatchController
                                            .teamInMatchList[flag + 1].teamName,
                                        image2: teamInMatchController
                                                    .teamInMatchList[flag + 1]
                                                    .teamInTournamentId ==
                                                null
                                            ? ""
                                            : teamInMatchController
                                                .teamInMatchList[flag + 1]
                                                .teamInTournament!
                                                .team!
                                                .teamAvatar,
                                        score2: teamInMatchController
                                                    .teamInMatchList[flag + 1]
                                                    .teamScore
                                                    .toString() ==
                                                "null"
                                            ? 0
                                            : teamInMatchController
                                                .teamInMatchList[flag + 1]
                                                .teamScore,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            )
                          : Column(
                              children: [
                                SizedBox(
                                  height: kPadding,
                                ),
                                const Text(
                                  "Chưa có lịch thi đấu",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ],
                            ),
                    ),
                  )
                ],
              ),
            ),
            generalController.isLoading.value
                ? const LoadingScreen()
                : Container(),
          ],
        ),
      ),
    );
  }
}
