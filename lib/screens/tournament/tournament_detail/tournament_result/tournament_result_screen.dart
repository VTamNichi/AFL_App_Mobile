import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_result_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/tournament/tournament_detail/tournament_result/components/tournament_result_build.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournamentResultsScreen extends StatelessWidget {
  TournamentResultsScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final tournamentResultController = Get.put(TournamentResultsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(
                "Thống kê giải đấu",
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
            body: tournamentResultController.tournamentResultsList.isEmpty
                ? const Center(
                    child: Text(
                      "Giải đấu chưa có thống kê",
                      style: TextStyle(fontSize: 22),
                    ),
                  )
                : Column(
                    children: [
                      Text(
                        "Vô địch",
                        style: TextStyle(
                            color: kBlackText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                        color: Colors.yellow[100],
                        child: Row(
                          children: [
                            const ClipOval(
                              child: Image(
                                image: AssetImage("assets/images/one.png"),
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: kPadding,
                            ),
                            ClipOval(
                              child: Image(
                                image: NetworkImage(tournamentResultController
                                    .tournamentResultsList[0]
                                    .team!
                                    .teamAvatar!),
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: kPadding / 3,
                            ),
                            Expanded(
                              child: Text(
                                tournamentResultController
                                    .tournamentResultsList[0].team!.teamName!,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: kBlackText, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: kPadding,
                      ),
                      Text(
                        "Á quân",
                        style: TextStyle(
                            color: kBlackText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                        color: Colors.grey[300],
                        child: Row(
                          children: [
                            const ClipOval(
                              child: Image(
                                image: AssetImage("assets/images/second.png"),
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: kPadding,
                            ),
                            ClipOval(
                              child: Image(
                                image: NetworkImage(tournamentResultController
                                    .tournamentResultsList[1]
                                    .team!
                                    .teamAvatar!),
                                width: 50,
                                height: 50,
                              ),
                            ),
                            SizedBox(
                              width: kPadding / 3,
                            ),
                            Expanded(
                              child: Text(
                                tournamentResultController
                                    .tournamentResultsList[1].team!.teamName!,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: kBlackText, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: kPadding,
                      ),
                      Text(
                        "Vua phá lưới",
                        style: TextStyle(
                            color: kBlackText,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const BuildTournamentResults(
                        image: "",
                        name: "Tên cầu thủ",
                        cloNum: "Số áo",
                        scoreNum: "Số bàn",
                        title: "a",
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: tournamentResultController
                                .tournamentResultsList.length -
                            2,
                        itemBuilder: (BuildContext context, index) {
                          return BuildTournamentResults(
                            image: tournamentResultController
                                .tournamentResultsList[index + 2]
                                .footballPlayer!
                                .playerAvatar!,
                            name: tournamentResultController
                                .tournamentResultsList[index + 2]
                                .footballPlayer!
                                .playerName,
                            cloNum: tournamentResultController
                                .tournamentResultsList[index + 2].clothesNumber,
                            scoreNum: tournamentResultController
                                .tournamentResultsList[index + 2]
                                .totalWinScrore,
                            title: "",
                          );
                        },
                      ),
                    ],
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
