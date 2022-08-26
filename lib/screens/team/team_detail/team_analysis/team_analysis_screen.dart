import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamAnalysisScreen extends StatelessWidget {
  TeamAnalysisScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final teamController = Get.put(TeamController());

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
                "Thống kê đội bóng",
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
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 270,
                    decoration: BoxDecoration(
                      color: const Color(0xfff0f0f0),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          blurRadius: 4,
                          offset: const Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(0, kPadding, 0, kPadding),
                    child: Column(
                      children: [
                        Text(
                          "Giải thưởng",
                          style: TextStyle(
                              color: kBlackText,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 170,
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
                              padding:
                                  EdgeInsets.fromLTRB(0, kPadding, 0, kPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Giải nhất",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/gold-cup.png"),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    teamController.champion.value.toString(),
                                    style: TextStyle(
                                        color: kBlackText, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 170,
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
                              padding:
                                  EdgeInsets.fromLTRB(0, kPadding, 0, kPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Giải nhì",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/silver-cup.png"),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    teamController.second.value.toString(),
                                    style: TextStyle(
                                        color: kBlackText, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              alignment: Alignment.center,
                              width: 120,
                              height: 170,
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
                              padding:
                                  EdgeInsets.fromLTRB(0, kPadding, 0, kPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Giải ba",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/bronze-cup.png"),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    teamController.third.value.toString(),
                                    style: TextStyle(
                                        color: kBlackText, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            
                            Expanded(child: Container()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 480,
                    decoration: BoxDecoration(
                      color: const Color(0xfff0f0f0),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          blurRadius: 4,
                          offset: const Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(0, kPadding, 0, kPadding),
                    child: Column(
                      children: [
                        Text(
                          "Trận đấu",
                          style: TextStyle(
                              color: kBlackText,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 170,
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
                              padding:
                                  EdgeInsets.fromLTRB(0, kPadding, 0, kPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Tổng số trận",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/totalMatch.png"),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    teamController.teamAnalysis.value.totalMatch
                                        .toString(),
                                    style: TextStyle(
                                        color: kBlackText, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 170,
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
                              padding:
                                  EdgeInsets.fromLTRB(0, kPadding, 0, kPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Số trận thắng",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/totalWin.png"),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    teamController.teamAnalysis.value.totalWin
                                        .toString(),
                                    style: TextStyle(
                                        color: kBlackText, fontSize: 20),
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
                        Row(
                          children: [
                            Expanded(child: Container()),
                            Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 170,
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
                              padding:
                                  EdgeInsets.fromLTRB(0, kPadding, 0, kPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Số trận hòa",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/totalDraw.png"),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    teamController.teamAnalysis.value.totalDraw
                                        .toString(),
                                    style: TextStyle(
                                        color: kBlackText, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 170,
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
                              padding:
                                  EdgeInsets.fromLTRB(0, kPadding, 0, kPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Số trận thua",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/totalLose.png"),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    teamController.teamAnalysis.value.totalWin
                                        .toString(),
                                    style: TextStyle(
                                        color: kBlackText, fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                          ],
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
