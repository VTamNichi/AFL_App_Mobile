import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/football_player_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootballPlayerAnalysisScreen extends StatelessWidget {
  FootballPlayerAnalysisScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final footballPlayerController = Get.put(FootballPlayerController());

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
                "Thành tích cầu thủ",
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
                          "Thành tích cá nhân",
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
                                    "Giải nhất",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/one.png"),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    footballPlayerController.champion.value
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
                                    "Giải nhì",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/second.png"),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    footballPlayerController.second.value
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
                                    "Giải ba",
                                    style: TextStyle(
                                        color: kBlackText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/three.png"),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    footballPlayerController.third.value
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
                                    "Vua phá lưới",
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
                                    footballPlayerController.topGoal.value
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
