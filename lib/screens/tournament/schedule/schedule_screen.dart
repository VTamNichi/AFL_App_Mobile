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
                  Container(
                    padding:
                        EdgeInsets.fromLTRB(kPadding / 2, 0, kPadding / 2, 0),
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 50,
                          child: SvgPicture.asset(
                            tournamentController.tournamentDetail.value
                                        .tournamentTypeId ==
                                    1
                                ? 'assets/images/knockout_check.svg'
                                : tournamentController.tournamentDetail.value
                                            .tournamentTypeId ==
                                        2
                                    ? 'assets/images/circle_check.svg'
                                    : 'assets/images/table_check.svg',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            tournamentController.tournamentDetail.value
                                        .tournamentTypeId ==
                                    1
                                ? "Loại trực tiếp"
                                : tournamentController.tournamentDetail.value
                                            .tournamentTypeId ==
                                        2
                                    ? "Vòng tròn"
                                    : "Chia bảng đấu",
                            style: TextStyle(
                              color: kBlackText,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                          child: Text(
                            ".",
                            style: TextStyle(
                              color: kBlackText,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
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
                  SizedBox(
                    height: kPadding,
                  ),
                  if (tournamentController
                          .tournamentDetail.value.tournamentTypeId ==
                      1)
                    ...[]
                  else if (tournamentController
                          .tournamentDetail.value.tournamentTypeId ==
                      2)
                    ...[]
                  else ...[
                    Container(
                      padding: EdgeInsets.all(kPadding / 2),
                      width: double.infinity,
                      height: 100,
                      color: kBlueBlack,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "VÒNG BẢNG",
                            style: TextStyle(
                                color: kWhiteText,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: kPadding / 2,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  //footballPlayerController.showOptionSearchFootballPlayer(context, element);
                                },
                                child: Container(
                                  //width: 50,
                                  height: 30,
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  margin: EdgeInsets.only(
                                      left: kPadding / 2, right: kPadding / 2),
                                  decoration: BoxDecoration(
                                    color:
                                        // footballPlayerController.element.contains(element)
                                        //     ? kGreenLightColor :
                                        kBackgroundColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    border: Border.all(
                                        color: kGreyColor,
                                        width: 1,
                                        style: BorderStyle.solid),
                                  ),
                                  child: Text(
                                    "Tất cả",
                                    style: TextStyle(
                                        color:
                                            // footballPlayerController.element.contains(element)
                                            //     ? kWhiteText :
                                            kGreyColor),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //footballPlayerController.showOptionSearchFootballPlayer(context, element);
                                },
                                child: Container(
                                  height: 30,
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  margin: EdgeInsets.only(
                                      left: kPadding / 2, right: kPadding / 2),
                                  decoration: BoxDecoration(
                                    color:
                                        // footballPlayerController.element.contains(element)
                                        //     ? kGreenLightColor :
                                        kBackgroundColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    border: Border.all(
                                        color: kGreyColor,
                                        width: 1,
                                        style: BorderStyle.solid),
                                  ),
                                  child: Text(
                                    "Bảng A",
                                    style: TextStyle(
                                        color:
                                            // footballPlayerController.element.contains(element)
                                            //     ? kWhiteText :
                                            kGreyColor),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  //footballPlayerController.showOptionSearchFootballPlayer(context, element);
                                },
                                child: Container(
                                  height: 30,
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  margin: EdgeInsets.only(
                                      left: kPadding / 2, right: kPadding / 2),
                                  decoration: BoxDecoration(
                                    color:
                                        // footballPlayerController.element.contains(element)
                                        //     ? kGreenLightColor :
                                        kBackgroundColor,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    border: Border.all(
                                        color: kGreyColor,
                                        width: 1,
                                        style: BorderStyle.solid),
                                  ),
                                  child: Text(
                                    "B",
                                    style: TextStyle(
                                        color:
                                            // footballPlayerController.element.contains(element)
                                            //     ? kWhiteText :
                                            kGreyColor),
                                  ),
                                ),
                              ),
                              if (tournamentController
                                      .tournamentDetail.value.groupNumber ==
                                  4) ...[
                                GestureDetector(
                                  onTap: () {
                                    //footballPlayerController.showOptionSearchFootballPlayer(context, element);
                                  },
                                  child: Container(
                                    //width: 50,
                                    height: 30,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    margin: EdgeInsets.only(
                                        left: kPadding / 2,
                                        right: kPadding / 2),
                                    decoration: BoxDecoration(
                                      color:
                                          // footballPlayerController.element.contains(element)
                                          //     ? kGreenLightColor :
                                          kBackgroundColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      border: Border.all(
                                          color: kGreyColor,
                                          width: 1,
                                          style: BorderStyle.solid),
                                    ),
                                    child: Text(
                                      "C",
                                      style: TextStyle(
                                          color:
                                              // footballPlayerController.element.contains(element)
                                              //     ? kWhiteText :
                                              kGreyColor),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //footballPlayerController.showOptionSearchFootballPlayer(context, element);
                                  },
                                  child: Container(
                                    height: 30,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    margin: EdgeInsets.only(
                                        left: kPadding / 2,
                                        right: kPadding / 2),
                                    decoration: BoxDecoration(
                                      color:
                                          // footballPlayerController.element.contains(element)
                                          //     ? kGreenLightColor :
                                          kBackgroundColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      border: Border.all(
                                          color: kGreyColor,
                                          width: 1,
                                          style: BorderStyle.solid),
                                    ),
                                    child: Text(
                                      "D",
                                      style: TextStyle(
                                          color:
                                              // footballPlayerController.element.contains(element)
                                              //     ? kWhiteText :
                                              kGreyColor),
                                    ),
                                  ),
                                ),
                              ],
                            ],
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
                    height: size.height - 301,
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
                                return GestureDetector(
                                  onTap: () async {
                                    generalController.isLoading.value = true;
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
                                    matchDetailController.listCommentLive.value = <UserComment>[];
                                    await matchDetailController.joinRoom(matchController.matchId.value.toString(), true);
                                    generalController.isLoading.value = false;
                                    Get.to(MatchDetailScreen());
                                  },
                                  child: ListMatch(
                                    name1: teamInMatchController
                                        .teamInMatchList[flag].teamName,

                                    image1: teamInMatchController
                                        .teamInMatchList[flag].teamInTournament!.team!.teamAvatar,
                                    score1: teamInMatchController
                                                .teamInMatchList[flag].teamScore
                                                .toString() ==
                                            "null"
                                        ? 0
                                        : teamInMatchController
                                            .teamInMatchList[flag].teamScore,
                                    name2: teamInMatchController
                                        .teamInMatchList[flag + 1].teamName,
                                    image2: teamInMatchController
                                        .teamInMatchList[flag + 1].teamInTournament!.team!.teamAvatar,
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
