import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/notification_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/notification/notification_screen.dart';
import 'package:amateur_football_league_mobile/screens/team/components/body.dart';
import 'package:amateur_football_league_mobile/screens/team/components/search_team_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamScreen extends StatelessWidget {
  TeamScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final teamController = Get.put(TeamController());
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
                teamController.nameSearchTeam.value.isEmpty
                    ? "Đội bóng"
                    : teamController.nameSearchTeam.value,
                style: TextStyle(
                  color: kBlackText,
                ),
              ),
              centerTitle:
                  teamController.nameSearchTeam.value.isEmpty ? true : false,
              automaticallyImplyLeading: false,
              backgroundColor: kBackgroundColor,
              leading: IconButton(
                icon: Icon(
                  Icons.search,
                  color: kBlackText,
                ),
                onPressed: () {
                  generalController.isSearchTour.value = false;
                  showSearch(
                      context: context,
                      delegate: SearchTeamDelegate(),
                      query: teamController.nameSearchTeam.value);
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
