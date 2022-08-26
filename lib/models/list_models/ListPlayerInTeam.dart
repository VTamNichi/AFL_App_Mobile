import 'package:amateur_football_league_mobile/models/PlayerInTeamsFull.dart';

class ListPlayerInTeam {
  List<PlayerInTeamsFull>? playerInTeamsFull;
  int? countList;
  int? currentPage;
  int? size;

  ListPlayerInTeam(
      {this.playerInTeamsFull, this.countList, this.currentPage, this.size});

  ListPlayerInTeam.fromJson(Map<String, dynamic> json) {
    if (json['playerInTeamsFull'] != null) {
      playerInTeamsFull = <PlayerInTeamsFull>[];
      json['playerInTeamsFull'].forEach((v) {
        playerInTeamsFull!.add(PlayerInTeamsFull.fromJson(v));
      });
    }
    countList = json['countList'];
    currentPage = json['currentPage'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (playerInTeamsFull != null) {
      data['playerInTeamsFull'] =
          playerInTeamsFull!.map((v) => v.toJson()).toList();
    }
    data['countList'] = countList;
    data['currentPage'] = currentPage;
    data['size'] = size;
    return data;
  }
}
