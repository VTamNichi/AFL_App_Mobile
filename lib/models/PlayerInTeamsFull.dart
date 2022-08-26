import 'package:amateur_football_league_mobile/models/FootballPlayer.dart';
import 'package:amateur_football_league_mobile/models/Team.dart';

class PlayerInTeamsFull {
  int? id;
  String? status;
  int? teamId;
  int? footballPlayerId;
  FootballPlayer? footballPlayer;
  Team? team;

  PlayerInTeamsFull(
      {this.id,
      this.status,
      this.teamId,
      this.footballPlayerId,
      this.footballPlayer,
      this.team});

  PlayerInTeamsFull.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    teamId = json['teamId'];
    footballPlayerId = json['footballPlayerId'];
    footballPlayer = json['footballPlayer'] != null
        ? FootballPlayer.fromJson(json['footballPlayer'])
        : null;
    team = json['team'] != null
        ? Team.fromJson(json['team'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['teamId'] = teamId;
    data['footballPlayerId'] = footballPlayerId;
    if (footballPlayer != null) {
      data['footballPlayer'] = footballPlayer!.toJson();
    }
    if (team != null) {
      data['team'] = team!.toJson();
    }
    return data;
  }
}