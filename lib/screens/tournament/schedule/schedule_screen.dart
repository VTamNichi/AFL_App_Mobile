import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/tournament/schedule/components/list_match.dart';
import 'package:amateur_football_league_mobile/screens/tournament/schedule/match_detail/match_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final tournamentController = Get.put(TournamentController());
  final teamInMatchController = Get.put(TeamInMatchController());
  final matchController = Get.put(MatchController());

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
                        const SizedBox(
                          width: 50,
                          child: Icon(
                            Icons.change_circle_sharp,
                            size: 40,
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
                            "10 trận đấu",
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
                  Divider(
                    color: kGreyColor,
                    height: 1,
                  ),
                  SizedBox(
                    height: size.height - 201,
                    child: SingleChildScrollView(
                      child: teamInMatchController.teamInMatchList.isNotEmpty ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            (teamInMatchController.teamInMatchList.length / 2)
                                .round(),
                        itemBuilder: (BuildContext context, index) {
                          int flag = 0;
                          flag+=2 * index;
                          return GestureDetector(
                            onTap: () async {
                              matchController.matchId.value = teamInMatchController.teamInMatchList[flag].matchId!;
                              Get.to(MatchDetailScreen());
                            },
                            child: ListMatch(
                              name1: teamInMatchController
                                  .teamInMatchList[flag].teamName,
                              image1: "",
                              score1: teamInMatchController
                                  .teamInMatchList[flag].teamScore,
                              name2: teamInMatchController
                                  .teamInMatchList[flag+1].teamName,
                              image2: "",
                              score2: teamInMatchController
                                  .teamInMatchList[flag+1].teamScore,
                            ),
                          );
                        },
                      ) : Column(
                        children: [
                          SizedBox(height: kPadding,),
                          const Text("Chưa có lịch thi đấu", style: TextStyle(fontSize: 22),),
                        ],
                      ),
                    ),
                  ),
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
