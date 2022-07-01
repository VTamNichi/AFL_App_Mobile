class Notification {
  int? id;
  String? content;
  String? dateCreate;
  bool? isSeen;
  bool? isActive;
  int? userId;
  int? tournamentId;
  int? teamId;

  Notification(
      {this.id,
      this.content,
      this.dateCreate,
      this.isSeen,
      this.isActive,
      this.userId,
      this.tournamentId,
      this.teamId});

  Notification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    dateCreate = json['dateCreate'];
    isSeen = json['isSeen'];
    isActive = json['isActive'];
    userId = json['userId'];
    tournamentId = json['tournamentId'];
    teamId = json['teamId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['dateCreate'] = dateCreate;
    data['isSeen'] = isSeen;
    data['isActive'] = isActive;
    data['userId'] = userId;
    data['tournamentId'] = tournamentId;
    data['teamId'] = teamId;
    return data;
  }
}
