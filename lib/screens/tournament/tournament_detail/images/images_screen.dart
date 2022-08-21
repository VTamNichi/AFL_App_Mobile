import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/match_detail_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/tournament/tournament_detail/images/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagesScreen extends StatelessWidget {
  ImagesScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final tournamentController = Get.put(TournamentController());
  final teamInMatchController = Get.put(TeamInMatchController());
  final matchController = Get.put(MatchController());
  final matchDetailController = Get.put(MatchDetailController());

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
                "Hình ảnh giải đấu",
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
            body: Body(),
          ),
          generalController.isLoading.value
              ? const LoadingScreen()
              : Container(),
        ],
      ),
    ));
  }
}
