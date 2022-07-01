import 'package:amateur_football_league_mobile/models/Notification.dart';

class ListNotification {
  List<Notification>? notifications;
  int? countList;
  int? currentPage;
  int? size;

  ListNotification(
      {this.notifications, this.countList, this.currentPage, this.size});

  ListNotification.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <Notification>[];
      json['notifications'].forEach((v) {
        notifications!.add(Notification.fromJson(v));
      });
    }
    countList = json['countList'];
    currentPage = json['currentPage'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notifications != null) {
      data['notifications'] =
          notifications!.map((v) => v.toJson()).toList();
    }
    data['countList'] = countList;
    data['currentPage'] = currentPage;
    data['size'] = size;
    return data;
  }
}