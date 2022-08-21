import 'package:amateur_football_league_mobile/models/TournamentResult.dart';

class ListTournamentResult {
  List<TournamentResults>? tournamentResults;
  int? currentPage;
  int? size;

  ListTournamentResult({this.tournamentResults, this.currentPage, this.size});

  ListTournamentResult.fromJson(Map<String, dynamic> json) {
    if (json['tournamentResults'] != null) {
      tournamentResults = <TournamentResults>[];
      json['tournamentResults'].forEach((v) {
        tournamentResults!.add(TournamentResults.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tournamentResults != null) {
      data['tournamentResults'] =
          tournamentResults!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = currentPage;
    data['size'] = size;
    return data;
  }
}
