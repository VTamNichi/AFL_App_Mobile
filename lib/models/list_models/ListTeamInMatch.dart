import 'package:amateur_football_league_mobile/models/TeamInMatch.dart';

class ListTeamInMatch {
  List<TeamInMatch>? teamsInMatch;

  ListTeamInMatch({this.teamsInMatch});

  ListTeamInMatch.fromJson(Map<String, dynamic> json) {
    if (json['teamsInMatch'] != null) {
      teamsInMatch = <TeamInMatch>[];
      json['teamsInMatch'].forEach((v) {
        teamsInMatch!.add(TeamInMatch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (teamsInMatch != null) {
      data['teamsInMatch'] = teamsInMatch!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}