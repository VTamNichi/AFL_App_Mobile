import 'package:amateur_football_league_mobile/models/Tournament.dart';

class ListTournament {
  List<Tournament>? tournaments;
  int? countList;
  int? currentPage;
  int? size;

  ListTournament({this.tournaments, this.countList, this.currentPage, this.size});

  ListTournament.fromJson(Map<String, dynamic> json) {
    if (json['tournaments'] != null) {
      tournaments = <Tournament>[];
      json['tournaments'].forEach((v) {
        tournaments!.add(Tournament.fromJson(v));
      });
    }
    countList = json['countList'];
    currentPage = json['currentPage'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tournaments != null) {
      data['tournaments'] = tournaments!.map((v) => v.toJson()).toList();
    }
    data['countList'] = countList;
    data['currentPage'] = currentPage;
    data['size'] = size;
    return data;
  }
}