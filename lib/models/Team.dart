class Team {
  int? id;
  String? teamName;
  String? teamAvatar;
  String? teamArea;
  String? teamPhone;
  String? teamGender;
  String? dateCreate;
  String? description;
  bool? status;
  int? numberPlayerInTeam;

  Team(
      {this.id,
      this.teamName,
      this.teamAvatar,
      this.teamArea,
      this.teamPhone,
      this.teamGender,
      this.dateCreate,
      this.description,
      this.status,
      this.numberPlayerInTeam});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamName = json['teamName'];
    teamAvatar = json['teamAvatar'];
    teamArea = json['teamArea'];
    teamPhone = json['teamPhone'];
    teamGender = json['teamGender'];
    dateCreate = json['dateCreate'];
    description = json['description'];
    status = json['status'];
    numberPlayerInTeam = json['numberPlayerInTeam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['teamName'] = teamName;
    data['teamAvatar'] = teamAvatar;
    data['teamArea'] = teamArea;
    data['teamPhone'] = teamPhone;
    data['teamGender'] = teamGender;
    data['dateCreate'] = dateCreate;
    data['description'] = description;
    data['status'] = status;
    data['numberPlayerInTeam'] = numberPlayerInTeam;
    return data;
  }
}