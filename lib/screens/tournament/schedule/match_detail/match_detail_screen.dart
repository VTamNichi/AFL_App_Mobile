import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/match_detail_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/hub_connection_builder.dart';

class MatchDetailScreen extends StatelessWidget {
  MatchDetailScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final matchController = Get.put(MatchController());
  final userController = Get.put(UserController());
  final tournamentController = Get.put(TournamentController());
  final teamInMatchController = Get.put(TeamInMatchController());
  final matchDetailController = Get.put(MatchDetailController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                "Chi tiết trận đấu",
                style: TextStyle(
                  color: kWhiteText,
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: kBlueBlack,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: kWhiteText,
                ),
                onPressed: () {
                  matchDetailController.joinRoom("room", false);
                  Get.back();
                },
              ),
            ),
            backgroundColor: kGreyBackground,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(kPadding),
                    color: kBlueBlack,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image(
                                      image: teamInMatchController
                                                  .teamInMatchDetail1
                                                  .value
                                                  .teamInTournamentId ==
                                              null
                                          ? const NetworkImage(
                                              "",
                                            )
                                          : NetworkImage(
                                              teamInMatchController
                                                  .teamInMatchDetail1
                                                  .value
                                                  .teamInTournament!
                                                  .team!
                                                  .teamAvatar!,
                                            ),
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        "assets/images/team_default.jpg",
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: kPadding / 2,
                                  ),
                                  Text(
                                    teamInMatchController.teamInMatchDetail1
                                            .value.teamName!.isEmpty
                                        ? "Chưa có đội"
                                        : teamInMatchController
                                            .teamInMatchDetail1.value.teamName
                                            .toString(),
                                    style: TextStyle(
                                      color: kWhiteText,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Row(
                                children: [
                                  Text(
                                    teamInMatchController.teamInMatchDetail1
                                                    .value.teamScore
                                                    .toString() ==
                                                "null" ||
                                            teamInMatchController
                                                    .teamInMatchDetail1
                                                    .value
                                                    .teamScore
                                                    .toString() ==
                                                ""
                                        ? "0"
                                        : teamInMatchController
                                            .teamInMatchDetail1.value.teamScore
                                            .toString(),
                                    style: TextStyle(
                                      color: kWhiteText,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    "-",
                                    style: TextStyle(
                                      color: kWhiteText,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    teamInMatchController.teamInMatchDetail2
                                                    .value.teamScore
                                                    .toString() ==
                                                "null" ||
                                            teamInMatchController
                                                    .teamInMatchDetail2
                                                    .value
                                                    .teamScore
                                                    .toString() ==
                                                ""
                                        ? "0"
                                        : teamInMatchController
                                            .teamInMatchDetail2.value.teamScore
                                            .toString(),
                                    style: TextStyle(
                                      color: kWhiteText,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image(
                                      image: teamInMatchController
                                                  .teamInMatchDetail2
                                                  .value
                                                  .teamInTournamentId ==
                                              null
                                          ? const NetworkImage(
                                              "",
                                            )
                                          : NetworkImage(
                                              teamInMatchController
                                                  .teamInMatchDetail2
                                                  .value
                                                  .teamInTournament!
                                                  .team!
                                                  .teamAvatar!,
                                            ),
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        "assets/images/team_default.jpg",
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: kPadding / 2,
                                  ),
                                  Text(
                                    teamInMatchController.teamInMatchDetail2
                                            .value.teamName!.isEmpty
                                            .toString()
                                            .isEmpty
                                        ? "Chưa có đội"
                                        : teamInMatchController
                                            .teamInMatchDetail2.value.teamName
                                            .toString(),
                                    style: TextStyle(
                                      color: kWhiteText,
                                      fontSize: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: kPadding / 2,
                        ),
                        Text(
                          matchController.matchDetail.value.matchDate
                                      .toString() ==
                                  "null"
                              ? "Chưa cập nhật ngày thi đấu"
                              : matchController.matchDetail.value.matchDate
                                  .toString(),
                          style: TextStyle(
                            color: kGreyColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Column(
                    children: matchDetailController.matchDetailList
                        .map(
                          (matchDetail) => Row(
                            children: [
                              Expanded(flex: 2, child: Container()),
                              matchDetail.teamInTournamentId ==
                                      teamInMatchController.teamInMatchDetail1
                                          .value.teamInTournamentId
                                  ? Expanded(
                                      flex: 3,
                                      child: Text(matchDetail
                                              .footballPlayer!.playerName! +
                                          " (" +
                                          matchDetail.clothesNumber.toString() +
                                          ")"),
                                    )
                                  : Expanded(flex: 3, child: Container()),
                              matchDetail.actionMatchId == 1
                                  ? Container(
                                      padding: EdgeInsets.all(kPadding / 4),
                                      decoration: BoxDecoration(
                                        color: kGreyBackground,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.7),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                4), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                              'assets/images/soccer-ball-retina.png',
                                            ),
                                            width: 40,
                                            height: 40,
                                            fit: BoxFit.contain,
                                          ),
                                          Text(matchDetail.actionMinute
                                                  .toString() +
                                              "'"),
                                        ],
                                      ),
                                    )
                                  : matchDetail.actionMatchId == 2
                                      ? Container(
                                          padding: EdgeInsets.all(kPadding / 4),
                                          decoration: BoxDecoration(
                                            color: kGreyBackground,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.7),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    4), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              const Image(
                                                image: AssetImage(
                                                  'assets/images/yellow-card.png',
                                                ),
                                                width: 40,
                                                height: 40,
                                                fit: BoxFit.contain,
                                              ),
                                              Text(matchDetail.actionMinute
                                                      .toString() +
                                                  "'"),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          padding: EdgeInsets.all(kPadding / 4),
                                          decoration: BoxDecoration(
                                            color: kGreyBackground,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.7),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    4), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: [
                                              const Image(
                                                image: AssetImage(
                                                  'assets/images/red-card.png',
                                                ),
                                                width: 40,
                                                height: 40,
                                                fit: BoxFit.contain,
                                              ),
                                              Text(matchDetail.actionMinute
                                                      .toString() +
                                                  "'"),
                                            ],
                                          ),
                                        ),
                              matchDetail.teamInTournamentId ==
                                      teamInMatchController.teamInMatchDetail2
                                          .value.teamInTournamentId
                                  ? Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: kPadding / 2),
                                        child: Text(matchDetail
                                                .footballPlayer!.playerName! +
                                            " (" +
                                            matchDetail.clothesNumber
                                                .toString() +
                                            ")"),
                                      ),
                                    )
                                  : Expanded(flex: 3, child: Container()),
                              Expanded(flex: 2, child: Container()),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                  Container(
                    padding: EdgeInsets.all(kPadding),
                    width: double.infinity,
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () async {
                        generalController.isLoading.value = true;
                        if (matchController
                            .matchDetail.value.tokenLivestream!.isEmpty) {
                          if (userController.user.value.id ==
                              tournamentController
                                  .tournamentDetail.value.userId) {
                            await matchController
                                .createToken(matchController.matchDetail.value);
                          }
                        }
                        generalController.isLoading.value = false;
                        matchController.onJoin(
                            isLivestream: userController.user.value.id ==
                                tournamentController
                                    .tournamentDetail.value.userId,
                            context: context);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              kGreenLightColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ))),
                      child: Text(
                        userController.user.value.id ==
                                tournamentController
                                    .tournamentDetail.value.userId
                            ? "TẠO LIVESTREAM"
                            : "XEM LIVESTREAM",
                        style: TextStyle(color: kWhiteText, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          generalController.isLoading.value
              ? const LoadingScreen()
              : Container(),
        ],
      ),
    ));
  }
}
