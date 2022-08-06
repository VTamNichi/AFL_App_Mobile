import 'FootballPlayer.dart';

class MatchDetail {
  int? id;
  int? actionMatchId;
  String? actionMinute;
  int? matchId;
  int? playerInTournamentId;
  int? footballPlayerId;
  FootballPlayer? footballPlayer;
  Null? match;
  Null? playerInTournament;

  MatchDetail(
      {this.id,
      this.actionMatchId,
      this.actionMinute,
      this.matchId,
      this.playerInTournamentId,
      this.footballPlayerId,
      this.footballPlayer,
      this.match,
      this.playerInTournament});

  MatchDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    actionMatchId = json['actionMatchId'];
    actionMinute = json['actionMinute'];
    matchId = json['matchId'];
    playerInTournamentId = json['playerInTournamentId'];
    footballPlayerId = json['footballPlayerId'];
    footballPlayer = json['footballPlayer'] != null
        ? new FootballPlayer.fromJson(json['footballPlayer'])
        : null;
    match = json['match'];
    playerInTournament = json['playerInTournament'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['actionMatchId'] = this.actionMatchId;
    data['actionMinute'] = this.actionMinute;
    data['matchId'] = this.matchId;
    data['playerInTournamentId'] = this.playerInTournamentId;
    data['footballPlayerId'] = this.footballPlayerId;
    if (this.footballPlayer != null) {
      data['footballPlayer'] = this.footballPlayer!.toJson();
    }
    data['match'] = this.match;
    data['playerInTournament'] = this.playerInTournament;
    return data;
  }
}
