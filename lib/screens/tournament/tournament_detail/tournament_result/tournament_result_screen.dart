import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_result_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
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
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 240,
                              decoration: BoxDecoration(
                                color: const Color(0xfff0f0f0),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(kPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Vô địch",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image:
                                          AssetImage("assets/images/one.png"),
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ClipOval(
                                    child: Image(
                                      image: NetworkImage(
                                          tournamentResultController
                                              .tournamentResultsList[0]
                                              .team!
                                              .teamAvatar!),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      tournamentResultController
                                          .tournamentResultsList[0]
                                          .team!
                                          .teamName!,
                                      style: TextStyle(
                                          color: kBlackText, fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 240,
                              decoration: BoxDecoration(
                                color: const Color(0xfff0f0f0),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    blurRadius: 4,
                                    offset:
                                        const Offset(4, 8), // Shadow position
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(kPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Á quân",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/second.png"),
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ClipOval(
                                    child: Image(
                                      image: NetworkImage(
                                          tournamentResultController
                                              .tournamentResultsList[1]
                                              .team!
                                              .teamAvatar!),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      tournamentResultController
                                          .tournamentResultsList[1]
                                          .team!
                                          .teamName!,
                                      style: TextStyle(
                                          color: kBlackText, fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
                        ),
                        SizedBox(
                          height: kPadding,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                          decoration: BoxDecoration(
                            color: const Color(0xfff0f0f0),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                blurRadius: 4,
                                offset: Offset(4, 8), // Shadow position
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(kPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Vua phá lưới (" +
                                    tournamentResultController
                                        .tournamentResultsList[2].totalWinScrore
                                        .toString() +
                                    " bàn)",
                                style: TextStyle(
                                    color: kBlackText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: kPadding,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: tournamentResultController
                                        .tournamentResultsList.length -
                                    2,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                    padding:
                                        EdgeInsets.fromLTRB(0, 0, 0, kPadding),
                                    child: Row(
                                      children: [
                                        ClipOval(
                                          child: Image(
                                            image: NetworkImage(
                                                tournamentResultController
                                                    .tournamentResultsList[
                                                        index + 2]
                                                    .footballPlayer!
                                                    .playerAvatar!),
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                        SizedBox(
                                          width: kPadding / 2,
                                        ),
                                        Text(
                                          tournamentResultController
                                                  .tournamentResultsList[
                                                      index + 2]
                                                  .footballPlayer!
                                                  .playerName! +
                                              " (" +
                                              tournamentResultController
                                                  .tournamentResultsList[
                                                      index + 2]
                                                  .clothesNumber
                                                  .toString() +
                                              ")",
                                          style: TextStyle(
                                              color: kBlackText, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
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
