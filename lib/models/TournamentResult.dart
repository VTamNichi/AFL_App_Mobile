import 'package:amateur_football_league_mobile/models/FootballPlayer.dart';
import 'package:amateur_football_league_mobile/models/Team.dart';
import 'package:amateur_football_league_mobile/models/Tournament.dart';

class TournamentResults {
  int? id;
  String? prize;
  String? description;
  int? teamInTournamentId;
  int? tournamentId;
  int? teamId;
  int? footballPlayerId;
  int? totalYellowCard;
  int? totalRedCard;
  int? totalWinScrore;
  int? totalWinMatch;
  int? totalLoseMatch;
  int? totalDrawMatch;
  int? clothesNumber;
  int? totalLoseScrore;
  FootballPlayer? footballPlayer;
  Team? team;
  Null? teamInTournament;
  Tournament? tournament;

  TournamentResults(
      {this.id,
      this.prize,
      this.description,
      this.teamInTournamentId,
      this.tournamentId,
      this.teamId,
      this.footballPlayerId,
      this.totalYellowCard,
      this.totalRedCard,
      this.totalWinScrore,
      this.totalWinMatch,
      this.totalLoseMatch,
      this.totalDrawMatch,
      this.clothesNumber,
      this.totalLoseScrore,
      this.footballPlayer,
      this.team,
      this.teamInTournament,
      this.tournament});

  TournamentResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    prize = json['prize'];
    description = json['description'];
    teamInTournamentId = json['teamInTournamentId'];
    tournamentId = json['tournamentId'];
    teamId = json['teamId'];
    footballPlayerId = json['footballPlayerId'];
    totalYellowCard = json['totalYellowCard'];
    totalRedCard = json['totalRedCard'];
    totalWinScrore = json['totalWinScrore'];
    totalWinMatch = json['totalWinMatch'];
    totalLoseMatch = json['totalLoseMatch'];
    totalDrawMatch = json['totalDrawMatch'];
    clothesNumber = json['clothesNumber'];
    totalLoseScrore = json['totalLoseScrore'];
    footballPlayer = json['footballPlayer'] != null
        ? FootballPlayer.fromJson(json['footballPlayer'])
        : null;
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    teamInTournament = json['teamInTournament'];
    tournament = json['tournament'] != null ? Tournament.fromJson(json['tournament']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['prize'] = prize;
    data['description'] = description;
    data['teamInTournamentId'] = teamInTournamentId;
    data['tournamentId'] = tournamentId;
    data['teamId'] = teamId;
    data['footballPlayerId'] = footballPlayerId;
    data['totalYellowCard'] = totalYellowCard;
    data['totalRedCard'] = totalRedCard;
    data['totalWinScrore'] = totalWinScrore;
    data['totalWinMatch'] = totalWinMatch;
    data['totalLoseMatch'] = totalLoseMatch;
    data['totalDrawMatch'] = totalDrawMatch;
    data['clothesNumber'] = clothesNumber;
    data['totalLoseScrore'] = totalLoseScrore;
    if (footballPlayer != null) {
      data['footballPlayer'] = footballPlayer!.toJson();
    }
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['teamInTournament'] = teamInTournament;
    if (tournament != null) {
      data['tournament'] = tournament!.toJson();
    }
    return data;
  }
}
