import 'package:amateur_football_league_mobile/models/Team.dart';

class TeamInTournament {
  int? id;
  int? point;
  int? winScoreNumber;
  int? loseScoreNumber;
  int? differentPoint;
  int? totalYellowCard;
  int? totalRedCard;
  String? status;
  String? statusInTournament;
  int? tournamentId;
  int? teamId;
  String? groupName;
  Team? team;
  Null? tournament;

  TeamInTournament(
      {this.id,
      this.point,
      this.winScoreNumber,
      this.loseScoreNumber,
      this.differentPoint,
      this.totalYellowCard,
      this.totalRedCard,
      this.status,
      this.statusInTournament,
      this.tournamentId,
      this.teamId,
      this.groupName,
      this.team,
      this.tournament});

  TeamInTournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    point = json['point'];
    winScoreNumber = json['winScoreNumber'];
    loseScoreNumber = json['loseScoreNumber'];
    differentPoint = json['differentPoint'];
    totalYellowCard = json['totalYellowCard'];
    totalRedCard = json['totalRedCard'];
    status = json['status'];
    statusInTournament = json['statusInTournament'];
    tournamentId = json['tournamentId'];
    teamId = json['teamId'];
    groupName = json['groupName'];
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    tournament = json['tournament'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['point'] = point;
    data['winScoreNumber'] = winScoreNumber;
    data['loseScoreNumber'] = loseScoreNumber;
    data['differentPoint'] = differentPoint;
    data['totalYellowCard'] = totalYellowCard;
    data['totalRedCard'] = totalRedCard;
    data['status'] = status;
    data['statusInTournament'] = statusInTournament;
    data['tournamentId'] = tournamentId;
    data['teamId'] = teamId;
    data['groupName'] = groupName;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    return data;
  }
}
