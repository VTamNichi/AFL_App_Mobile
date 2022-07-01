import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/notification_controller.dart';
import 'package:amateur_football_league_mobile/screens/notification/components/build_notification_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final notificationController = Get.put(NotificationController());

  final generalController = Get.put(GeneralController());

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getNotificationData({bool isRefresh = false}) async {
    if (!isRefresh) {
      if (generalController.currentNotificationPage.value >=
          (notificationController.countListNotification.value / 8).ceil()) {
        refreshController.loadNoData();
        return true;
      } else {
        generalController.currentNotificationPage.value += 1;
      }
    }
    await notificationController.getListNotification(isRefresh: isRefresh);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => SizedBox(
        height: size.height - 40,
        child: SmartRefresher(
          controller: refreshController,
          enablePullUp: true,
          onRefresh: () async {
            final result = await getNotificationData(isRefresh: true);
            if (result) {
              refreshController.refreshCompleted();
            } else {
              refreshController.refreshFailed();
            }
          },
          onLoading: () async {
            final result = await getNotificationData(isRefresh: false);
            if (result) {
              refreshController.loadComplete();
            } else {
              refreshController.loadFailed();
            }
          },
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: notificationController.notificationList.length,
              itemBuilder: (BuildContext context, index) {
                return BuildNotificationList(
                  content:
                      notificationController.notificationList[index].content,
                  dateCreate:
                      notificationController.notificationList[index].dateCreate,
                  index: index,
                );
              }),
        ),
      ),
    );
  }
}
