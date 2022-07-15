import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/notification_controller.dart';
import 'package:amateur_football_league_mobile/models/Notification.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListNotification.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class NotificationAPI {
  static Future<int> getListNotification(
      int userID, int currentNotificationPage) async {
    final notificationController = GetX.Get.put(NotificationController());
    int rs = 0;
    try {
      if (currentNotificationPage == 0) {
        currentNotificationPage = 1;
      }
      final response = await http.get(
          Uri.parse(urlApi +
              "notifications?" +
              "user-id=" +
              userID.toString() +
              "&" +
              "page-offset=" +
              currentNotificationPage.toString() +
              "&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListNotification listNotification = ListNotification.fromJson(bodyJson);
        notificationController.countNew.value = listNotification.countNew!;
        if (currentNotificationPage > 1) {
          notificationController.notificationList
              .addAll(listNotification.notifications!);
        } else {
          notificationController.notificationList.value =
              listNotification.notifications!;
        }
        notificationController.countListNotification.value =
            listNotification.countList!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }

  static Future<int> updateOldNoti(int userId) async {
    final notificationController = GetX.Get.put(NotificationController());
    int rs = 0;
    try {
      final response = await http.post(
          Uri.parse(urlApi +
              "notifications/update-old-notification?userId=" +
              userId.toString()),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        notificationController.countNew.value = 0;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }

  static Future<int> seenNoti(Notification noti) async {
    int rs = 0;
    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data["id"] = noti.id;
      data["content"] = noti.content;
      data["dateCreate"] = noti.dateCreate;
      data["isSeen"] = true;
      data["isActive"] = noti.isActive;
      data["userId"] = noti.userId;
      data["tournamentId"] = noti.tournamentId;
      data["teamId"] = noti.teamId;
      final response = await http.put(
        Uri.parse(urlApi + "notifications"),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(data),
      );
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
