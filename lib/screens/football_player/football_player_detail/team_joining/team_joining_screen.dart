import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/football_player/football_player_detail/team_joining/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamJoiningScreen extends StatelessWidget {
  TeamJoiningScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());

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
                "Đội bóng tham gia",
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
            body: SingleChildScrollView(child: Body()),
          ),
          generalController.isLoading.value
              ? const LoadingScreen()
              : Container(),
        ],
      ),
    ));
  }
}
