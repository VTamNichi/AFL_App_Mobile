import 'package:amateur_football_league_mobile/models/Match.dart';
import 'package:amateur_football_league_mobile/models/TeamInTournament.dart';

class TeamInMatch {
  int? id;
  int? teamScore;
  int? yellowCardNumber;
  int? redCardNumber;
  String? nextTeam;
  String? teamName;
  int? teamInTournamentId;
  int? matchId;
  int? teamScoreLose;
  int? result;
  Match? match;
  TeamInTournament? teamInTournament;

  TeamInMatch(
      {this.id,
      this.teamScore,
      this.yellowCardNumber,
      this.redCardNumber,
      this.nextTeam,
      this.teamName,
      this.teamInTournamentId,
      this.matchId,
      this.teamScoreLose,
      this.result,
      this.match,
      this.teamInTournament});

  TeamInMatch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamScore = json['teamScore'];
    yellowCardNumber = json['yellowCardNumber'];
    redCardNumber = json['redCardNumber'];
    nextTeam = json['nextTeam'];
    teamName = json['teamName'];
    teamInTournamentId = json['teamInTournamentId'];
    matchId = json['matchId'];
    teamScoreLose = json['teamScoreLose'];
    result = json['result'];
    match = json['match'] != null ? Match.fromJson(json['match']) : null;
    teamInTournament = json['teamInTournament'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['teamScore'] = teamScore;
    data['yellowCardNumber'] = yellowCardNumber;
    data['redCardNumber'] = redCardNumber;
    data['nextTeam'] = nextTeam;
    data['teamName'] = teamName;
    data['teamInTournamentId'] = teamInTournamentId;
    data['matchId'] = matchId;
    data['teamScoreLose'] = teamScoreLose;
    data['result'] = result;
    if (match != null) {
      data['match'] = match!.toJson();
    }
    data['teamInTournament'] = teamInTournament;
    return data;
  }
}