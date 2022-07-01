import 'package:amateur_football_league_mobile/models/Match.dart';

class TeamInMatch {
  int? id;
  int? teamScore;
  int? yellowCardNumber;
  int? redCardNumber;
  int? teamInTournamentId;
  int? matchId;
  String? result;
  String? nextTeam;
  String? teamName;
  Match? match;
  Null? team;

  TeamInMatch(
      {this.id,
      this.teamScore,
      this.yellowCardNumber,
      this.redCardNumber,
      this.teamInTournamentId,
      this.matchId,
      this.result,
      this.nextTeam,
      this.teamName,
      this.match,
      this.team});

  TeamInMatch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamScore = json['teamScore'];
    yellowCardNumber = json['yellowCardNumber'];
    redCardNumber = json['redCardNumber'];
    teamInTournamentId = json['teamInTournamentId'];
    matchId = json['matchId'];
    result = json['result'];
    nextTeam = json['nextTeam'];
    teamName = json['teamName'];
    match = json['match'] != null ? Match.fromJson(json['match']) : null;
    team = json['team'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['teamScore'] = teamScore;
    data['yellowCardNumber'] = yellowCardNumber;
    data['redCardNumber'] = redCardNumber;
    data['teamInTournamentId'] = teamInTournamentId;
    data['matchId'] = matchId;
    data['result'] = result;
    data['nextTeam'] = nextTeam;
    data['teamName'] = teamName;
    if (match != null) {
      data['match'] = match!.toJson();
    }
    data['team'] = team;
    return data;
  }
}