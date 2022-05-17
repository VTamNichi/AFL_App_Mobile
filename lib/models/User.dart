class User {
  int? id;
  String? email;
  String? password;
  String? username;
  String? gender;
  String? dateOfBirth;
  String? address;
  String? phone;
  String? avatar;
  String? bio;
  String? statusBan;
  String? dateBan;
  String? dateUnban;
  int? flagReportComment;
  int? flagReportTeam;
  int? flagReportTournament;
  String? identityCard;
  String? phoneBusiness;
  String? nameBusiness;
  String? tinbusiness;
  bool? status;
  String? dateCreate;
  String? dateUpdate;
  String? dateDelete;
  int? roleId;

  User(
      {this.id,
      this.email,
      this.password,
      this.username,
      this.gender,
      this.dateOfBirth,
      this.address,
      this.phone,
      this.avatar,
      this.bio,
      this.statusBan,
      this.dateBan,
      this.dateUnban,
      this.flagReportComment,
      this.flagReportTeam,
      this.flagReportTournament,
      this.identityCard,
      this.phoneBusiness,
      this.nameBusiness,
      this.tinbusiness,
      this.status,
      this.dateCreate,
      this.dateUpdate,
      this.dateDelete,
      this.roleId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    username = json['username'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    address = json['address'];
    phone = json['phone'];
    avatar = json['avatar'];
    bio = json['bio'];
    statusBan = json['statusBan'];
    dateBan = json['dateBan'];
    dateUnban = json['dateUnban'];
    flagReportComment = json['flagReportComment'];
    flagReportTeam = json['flagReportTeam'];
    flagReportTournament = json['flagReportTournament'];
    identityCard = json['identityCard'];
    phoneBusiness = json['phoneBusiness'];
    nameBusiness = json['nameBusiness'];
    tinbusiness = json['tinbusiness'];
    status = json['status'];
    dateCreate = json['dateCreate'];
    dateUpdate = json['dateUpdate'];
    dateDelete = json['dateDelete'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['username'] = username;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['address'] = address;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['bio'] = bio;
    data['statusBan'] = statusBan;
    data['dateBan'] = dateBan;
    data['dateUnban'] = dateUnban;
    data['flagReportComment'] = flagReportComment;
    data['flagReportTeam'] = flagReportTeam;
    data['flagReportTournament'] = flagReportTournament;
    data['identityCard'] = identityCard;
    data['phoneBusiness'] = phoneBusiness;
    data['nameBusiness'] = nameBusiness;
    data['tinbusiness'] = tinbusiness;
    data['status'] = status;
    data['dateCreate'] = dateCreate;
    data['dateUpdate'] = dateUpdate;
    data['dateDelete'] = dateDelete;
    data['roleId'] = roleId;
    return data;
  }
}