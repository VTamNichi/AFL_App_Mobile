import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/notification_api.dart';
import 'package:amateur_football_league_mobile/models/Notification.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final generalController = Get.put(GeneralController());
  final userController = Get.put(UserController());
  
  RxList<Notification> notificationList = <Notification>[].obs;
  RxInt countListNotification = 0.obs;
  RxInt countNew = 0.obs;

  Future<void> getListNotification({bool isRefresh = false}) async {
    generalController.isLoading.value = true;
    if (isRefresh) {
      generalController.currentNotificationPage.value = 1;
    }
    await NotificationAPI.getListNotification(
        userController.user.value.id!,
        generalController.currentNotificationPage.value);
    generalController.isLoading.value = false;
  }

  Future<void> updateOldNoti() async {
    generalController.isLoading.value = true;
    await NotificationAPI.updateOldNoti(userController.user.value.id!);
    generalController.isLoading.value = false;
  }

  Future<void> seenNoti(Notification noti) async {
    generalController.isLoading.value = true;
    await NotificationAPI.seenNoti(noti);
    generalController.isLoading.value = false;
  }

}
