import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamDetailScreen extends StatelessWidget {
  TeamDetailScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(
      () => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(
                "Đội bóng",
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
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
            backgroundColor: kGreyBackground,
          ),
          generalController.isLoading.value
              ? const LoadingScreen()
              : Container(),
        ],
      ),
    ));
  }
}
