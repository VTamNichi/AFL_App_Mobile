class PlayerInTournament {
  int? id;
  int? teamInTournamentId;
  int? playerInTeamId;
  String? status;
  int? clothesNumber;

  PlayerInTournament(
      {this.id,
      this.teamInTournamentId,
      this.playerInTeamId,
      this.status,
      this.clothesNumber});

  PlayerInTournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamInTournamentId = json['teamInTournamentId'];
    playerInTeamId = json['playerInTeamId'];
    status = json['status'];
    clothesNumber = json['clothesNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['teamInTournamentId'] = teamInTournamentId;
    data['playerInTeamId'] = playerInTeamId;
    data['status'] = status;
    data['clothesNumber'] = clothesNumber;
    return data;
  }
}