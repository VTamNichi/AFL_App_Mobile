import 'package:amateur_football_league_mobile/models/FootballPlayer.dart';

class ListFootballPlayer {
  List<FootballPlayer>? footballPlayers;
  int? countList;
  int? currentPage;
  int? size;

  ListFootballPlayer(
      {this.footballPlayers, this.countList, this.currentPage, this.size});

  ListFootballPlayer.fromJson(Map<String, dynamic> json) {
    if (json['footballPlayers'] != null) {
      footballPlayers = <FootballPlayer>[];
      json['footballPlayers'].forEach((v) {
        footballPlayers!.add(FootballPlayer.fromJson(v));
      });
    }
    countList = json['countList'];
    currentPage = json['currentPage'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (footballPlayers != null) {
      data['footballPlayers'] =
          footballPlayers!.map((v) => v.toJson()).toList();
    }
    data['countList'] = countList;
    data['currentPage'] = currentPage;
    data['size'] = size;
    return data;
  }
}