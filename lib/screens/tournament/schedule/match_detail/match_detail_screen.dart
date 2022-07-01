import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchDetailScreen extends StatelessWidget {
  MatchDetailScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final matchController = Get.put(MatchController());
  final userController = Get.put(UserController());
  final tournamentController = Get.put(TournamentController());

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
            backgroundColor: kGreyBackground,
            body: Container(
              padding: EdgeInsets.all(kPadding),
              width: double.infinity,
              height: 100,
              child: ElevatedButton(
                onPressed: () async {
                  generalController.isLoading.value = true;
                  await matchController.getToken(matchController.matchId.value);
                  if (matchController
                      .matchDetail.value.tokenLivestream!.isEmpty) { 
                    if (userController.user.value.id ==
                        tournamentController.tournamentDetail.value.userId) {
                      await matchController
                          .createToken(matchController.matchDetail.value);
                    }
                  }
                  generalController.isLoading.value = false;
                  matchController.onJoin(
                      isLivestream: userController.user.value.id ==
                          tournamentController.tournamentDetail.value.userId,
                      context: context);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kGreenLightColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    ))),
                child: Text(
                  userController.user.value.id ==
                          tournamentController.tournamentDetail.value.userId
                      ? "TẠO LIVESTREAM"
                      : "XEM LIVESTREAM",
                  style: TextStyle(color: kWhiteText, fontSize: 20),
                ),
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
