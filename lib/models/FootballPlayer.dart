import 'package:amateur_football_league_mobile/models/User.dart';

class FootballPlayer {
  int? id;
  String? playerName;
  String? playerAvatar;
  String? position;
  String? description;
  bool? status;
  String? dateCreate;
  String? dateUpdate;
  String? dateDelete;
  User? userVM;

  FootballPlayer(
      {this.id,
      this.playerName,
      this.playerAvatar,
      this.position,
      this.description,
      this.status,
      this.dateCreate,
      this.dateUpdate,
      this.dateDelete,
      this.userVM});

  FootballPlayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerName = json['playerName'];
    playerAvatar = json['playerAvatar'];
    position = json['position'];
    description = json['description'];
    status = json['status'];
    dateCreate = json['dateCreate'];
    dateUpdate = json['dateUpdate'];
    dateDelete = json['dateDelete'];
    userVM =
        json['userVM'] != null ? User.fromJson(json['userVM']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['playerName'] = playerName;
    data['playerAvatar'] = playerAvatar;
    data['position'] = position;
    data['description'] = description;
    data['status'] = status;
    data['dateCreate'] = dateCreate;
    data['dateUpdate'] = dateUpdate;
    data['dateDelete'] = dateDelete;
    if (userVM != null) {
      data['userVM'] = userVM!.toJson();
    }
    return data;
  }
}