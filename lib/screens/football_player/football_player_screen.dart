import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/football_player_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/screens/football_player/components/search_football_player_delegate.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/notification/notification_screen.dart';
import 'package:amateur_football_league_mobile/screens/football_player/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootballPlayerScreen extends StatelessWidget {
  FootballPlayerScreen({Key? key}) : super(key: key);

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
              title: Text(
                footballPlayerController.nameSearchFootballPlayer.value.isEmpty ? "Cầu thủ" : footballPlayerController.nameSearchFootballPlayer.value,
                style: TextStyle(
                  color: kBlackText,
                ),
              ),
              centerTitle: footballPlayerController.nameSearchFootballPlayer.value.isEmpty ? true : false,
              automaticallyImplyLeading: false,
              backgroundColor: kBackgroundColor,
              leading: IconButton(
                icon: Icon(
                  Icons.search,
                  color: kBlackText,
                ),
                onPressed: () {
                  generalController.isSearchTour.value = false;
                  showSearch(context: context, delegate: SearchFootballPlayerDelegate(), query: footballPlayerController.nameSearchFootballPlayer.value);
                },
              ),
              actions: [
                SizedBox(
                  width: 60,
                  child: Stack(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          size: 34,
                          color: kBlackText,
                        ),
                        onPressed: () {
                          Get.to(NotificationScreen());
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            backgroundColor: kGreyBackground,
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
