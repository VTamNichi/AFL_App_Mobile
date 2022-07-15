import 'package:amateur_football_league_mobile/models/Notification.dart';

class ListNotification {
  List<Notification>? notifications;
  int? countList;
  int? countUnRead;
  int? countNew;
  int? currentPage;
  int? size;

  ListNotification(
      {this.notifications, this.countList, this.countUnRead, this.countNew, this.currentPage, this.size});

  ListNotification.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <Notification>[];
      json['notifications'].forEach((v) {
        notifications!.add(Notification.fromJson(v));
      });
    }
    countList = json['countList'];
    countUnRead = json['countUnRead'];
    countNew = json['countNew'];
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
    data['countUnRead'] = countUnRead;
    data['countNew'] = countNew;
    data['currentPage'] = currentPage;
    data['size'] = size;
    return data;
  }
}