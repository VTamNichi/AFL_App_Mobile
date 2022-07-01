import 'package:amateur_football_league_mobile/models/User.dart';

class Comment {
  int? id;
  String? content;
  String? dateCreate;
  String? dateDelete;
  String? dateUpdate;
  String? status;
  int? teamId;
  int? tournamentId;
  int? userId;
  User? user;

  Comment(
      {this.id,
      this.content,
      this.dateCreate,
      this.dateDelete,
      this.dateUpdate,
      this.status,
      this.teamId,
      this.tournamentId,
      this.userId,
      this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    dateCreate = json['dateCreate'];
    dateDelete = json['dateDelete'];
    dateUpdate = json['dateUpdate'];
    status = json['status'];
    teamId = json['teamId'];
    tournamentId = json['tournamentId'];
    userId = json['userId'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['dateCreate'] = dateCreate;
    data['dateDelete'] = dateDelete;
    data['dateUpdate'] = dateUpdate;
    data['status'] = status;
    data['teamId'] = teamId;
    data['tournamentId'] = tournamentId;
    data['userId'] = userId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}