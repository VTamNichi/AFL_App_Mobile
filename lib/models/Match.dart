class Match {
  int? id;
  String? matchDate;
  String? status;
  int? tournamentId;
  String? round;
  String? fight;
  String? groupFight;
  String? tokenLivestream;
  Null? tournament;

  Match(
      {this.id,
      this.matchDate,
      this.status,
      this.tournamentId,
      this.round,
      this.fight,
      this.groupFight,
      this.tokenLivestream,
      this.tournament});

  Match.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matchDate = json['matchDate'];
    status = json['status'];
    tournamentId = json['tournamentId'];
    round = json['round'];
    fight = json['fight'];
    groupFight = json['groupFight'];
    tokenLivestream = json['tokenLivestream'];
    tournament = json['tournament'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['matchDate'] = matchDate;
    data['status'] = status;
    data['tournamentId'] = tournamentId;
    data['round'] = round;
    data['fight'] = fight;
    data['groupFight'] = groupFight;
    data['tokenLivestream'] = tokenLivestream;
    data['tournament'] = tournament;
    return data;
  }
}