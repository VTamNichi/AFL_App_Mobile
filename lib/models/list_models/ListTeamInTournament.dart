import 'package:amateur_football_league_mobile/models/TeamInTournament.dart';

class ListTeamInTournament {
  List<TeamInTournament>? teamInTournaments;
  int? countList;
  int? currentPage;
  int? size;

  ListTeamInTournament(
      {this.teamInTournaments, this.countList, this.currentPage, this.size});

  ListTeamInTournament.fromJson(Map<String, dynamic> json) {
    if (json['teamInTournaments'] != null) {
      teamInTournaments = <TeamInTournament>[];
      json['teamInTournaments'].forEach((v) {
        teamInTournaments!.add(TeamInTournament.fromJson(v));
      });
    }
    countList = json['countList'];
    currentPage = json['currentPage'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teamInTournaments != null) {
      data['teamInTournaments'] =
          teamInTournaments!.map((v) => v.toJson()).toList();
    }
    data['countList'] = countList;
    data['currentPage'] = currentPage;
    data['size'] = size;
    return data;
  }
}
