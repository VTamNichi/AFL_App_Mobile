import 'package:amateur_football_league_mobile/models/Team.dart';

class ListTeam {
  List<Team>? teams;
  int? countList;
  int? currentPage;
  int? size;

  ListTeam({this.teams, this.countList, this.currentPage, this.size});

  ListTeam.fromJson(Map<String, dynamic> json) {
    if (json['teams'] != null) {
      teams = <Team>[];
      json['teams'].forEach((v) {
        teams!.add(Team.fromJson(v));
      });
    }
    countList = json['countList'];
    currentPage = json['currentPage'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teams != null) {
      data['teams'] = teams!.map((v) => v.toJson()).toList();
    }
    data['countList'] = countList;
    data['currentPage'] = currentPage;
    data['size'] = size;
    return data;
  }
}