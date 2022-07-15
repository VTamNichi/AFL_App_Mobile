import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/notification_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/notification/notification_screen.dart';
import 'package:amateur_football_league_mobile/screens/tournament/components/body.dart';
import 'package:amateur_football_league_mobile/screens/tournament/components/search_tournament_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournamentScreen extends StatelessWidget {
  TournamentScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final tournamentController = Get.put(TournamentController());
  final notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                tournamentController.nameSearchTour.value.isEmpty
                    ? "Giải đấu"
                    : tournamentController.nameSearchTour.value,
                style: TextStyle(
                  color: kBlackText,
                ),
              ),
              centerTitle: tournamentController.nameSearchTour.value.isEmpty
                  ? true
                  : false,
              automaticallyImplyLeading: false,
              backgroundColor: kBackgroundColor,
              leading: IconButton(
                icon: Icon(
                  Icons.search,
                  color: kBlackText,
                ),
                onPressed: () {
                  generalController.isSearchTour.value = true;
                  showSearch(
                      context: context,
                      delegate: SearchTournamentDelegate(),
                      query: tournamentController.nameSearchTour.value);
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
                        onPressed: () async {
                          await notificationController.updateOldNoti();
                          Get.to(NotificationScreen());
                        },
                      ),
                      notificationController.countNew.value > 0
                          ? Positioned(
                              top: 5,
                              right: 9,
                              child: Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kGreenLightColor,
                                ),
                                child: Center(
                                  child: Text(
                                    notificationController.countNew.value
                                            .toString() +
                                        "+",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
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
