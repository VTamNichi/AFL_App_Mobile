import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/notification_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/notification/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
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
                "Thông báo",
                style: TextStyle(
                  color: kBlackText,
                ),
              ),
              centerTitle: true,
              backgroundColor: kBackgroundColor,
              elevation: 1,
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
