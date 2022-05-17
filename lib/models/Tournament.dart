class Tournament {
  int? id;
  String? tournamentName;
  String? mode;
  String? tournamentPhone;
  String? tournamentGender;
  String? registerEndDate;
  String? tournamentStartDate;
  String? tournamentEndDate;
  String? footballFieldAddress;
  String? tournamentAvatar;
  String? description;
  int? matchMinutes;
  int? footballTeamNumber;
  int? footballPlayerMaxNumber;
  String? dateCreate;
  bool? status;
  int? userId;
  int? tournamentTypeId;
  int? footballFieldTypeId;
  int? numberTeamInTournament;

  Tournament(
      {this.id,
      this.tournamentName,
      this.mode,
      this.tournamentPhone,
      this.tournamentGender,
      this.registerEndDate,
      this.tournamentStartDate,
      this.tournamentEndDate,
      this.footballFieldAddress,
      this.tournamentAvatar,
      this.description,
      this.matchMinutes,
      this.footballTeamNumber,
      this.footballPlayerMaxNumber,
      this.dateCreate,
      this.status,
      this.userId,
      this.tournamentTypeId,
      this.footballFieldTypeId,
      this.numberTeamInTournament});

  Tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tournamentName = json['tournamentName'];
    mode = json['mode'];
    tournamentPhone = json['tournamentPhone'];
    tournamentGender = json['tournamentGender'];
    registerEndDate = json['registerEndDate'];
    tournamentStartDate = json['tournamentStartDate'];
    tournamentEndDate = json['tournamentEndDate'];
    footballFieldAddress = json['footballFieldAddress'];
    tournamentAvatar = json['tournamentAvatar'];
    description = json['description'];
    matchMinutes = json['matchMinutes'];
    footballTeamNumber = json['footballTeamNumber'];
    footballPlayerMaxNumber = json['footballPlayerMaxNumber'];
    dateCreate = json['dateCreate'];
    status = json['status'];
    userId = json['userId'];
    tournamentTypeId = json['tournamentTypeId'];
    footballFieldTypeId = json['footballFieldTypeId'];
    numberTeamInTournament = json['numberTeamInTournament'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['tournamentName'] = tournamentName;
    data['mode'] = mode;
    data['tournamentPhone'] = tournamentPhone;
    data['tournamentGender'] = tournamentGender;
    data['registerEndDate'] = registerEndDate;
    data['tournamentStartDate'] = tournamentStartDate;
    data['tournamentEndDate'] = tournamentEndDate;
    data['footballFieldAddress'] = footballFieldAddress;
    data['tournamentAvatar'] = tournamentAvatar;
    data['description'] = description;
    data['matchMinutes'] = matchMinutes;
    data['footballTeamNumber'] = footballTeamNumber;
    data['footballPlayerMaxNumber'] = footballPlayerMaxNumber;
    data['dateCreate'] = dateCreate;
    data['status'] = status;
    data['userId'] = userId;
    data['tournamentTypeId'] = tournamentTypeId;
    data['footballFieldTypeId'] = footballFieldTypeId;
    data['numberTeamInTournament'] = numberTeamInTournament;
    return data;
  }
}