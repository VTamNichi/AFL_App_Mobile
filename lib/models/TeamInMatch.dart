import 'package:amateur_football_league_mobile/models/Match.dart';
import 'package:amateur_football_league_mobile/models/TeamInTournament.dart';

class TeamInMatch {
  int? id;
  int? teamScore;
  int? scoreTieBreak;
  int? yellowCardNumber;
  int? redCardNumber;
  String? nextTeam;
  String? teamName;
  int? scorePenalty;
  int? teamInTournamentId;
  int? matchId;
  int? teamScoreLose;
  int? result;
  Match? match;
  TeamInTournament? teamInTournament;

  TeamInMatch(
      {this.id,
      this.teamScore,
      this.scoreTieBreak,
      this.yellowCardNumber,
      this.redCardNumber,
      this.nextTeam,
      this.teamName,
      this.scorePenalty,
      this.teamInTournamentId,
      this.matchId,
      this.teamScoreLose,
      this.result,
      this.match,
      this.teamInTournament});

  TeamInMatch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamScore = json['teamScore'];
    scoreTieBreak = json['scoreTieBreak'];
    yellowCardNumber = json['yellowCardNumber'];
    redCardNumber = json['redCardNumber'];
    nextTeam = json['nextTeam'];
    teamName = json['teamName'];
    scorePenalty = json['scorePenalty'];
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
    data['scoreTieBreak'] = scoreTieBreak;
    data['yellowCardNumber'] = yellowCardNumber;
    data['redCardNumber'] = redCardNumber;
    data['nextTeam'] = nextTeam;
    data['teamName'] = teamName;
    data['scorePenalty'] = scorePenalty;
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