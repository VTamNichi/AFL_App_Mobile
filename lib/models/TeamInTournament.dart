import 'package:amateur_football_league_mobile/models/Team.dart';
import 'package:amateur_football_league_mobile/models/Tournament.dart';

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
  Tournament? tournament;
  int? numberOfMatch;
  int? numberOfWin;
  int? numberOfLose;
  int? numberOfDraw;

  TeamInTournament({
    this.id,
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
    this.tournament,
    this.numberOfMatch,
    this.numberOfWin,
    this.numberOfLose,
    this.numberOfDraw,
  });

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
    numberOfMatch = json['numberOfMatch'];
    numberOfWin = json['numberOfWin'];
    numberOfLose = json['numberOfLose'];
    numberOfDraw = json['numberOfDraw'];
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
    data['numberOfMatch'] = numberOfMatch;
    data['numberOfWin'] = numberOfWin;
    data['numberOfLose'] = numberOfLose;
    data['numberOfDraw'] = numberOfDraw;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    return data;
  }
}
