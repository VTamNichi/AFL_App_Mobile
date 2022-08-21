class Images {
  int? id;
  String? imageURL;
  String? status;
  String? dateCreate;
  String? dateUpdate;
  String? dateDelete;
  int? tournamentId;

  Images(
      {this.id,
      this.imageURL,
      this.status,
      this.dateCreate,
      this.dateUpdate,
      this.dateDelete,
      this.tournamentId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageURL = json['imageURL'];
    status = json['status'];
    dateCreate = json['dateCreate'];
    dateUpdate = json['dateUpdate'];
    dateDelete = json['dateDelete'];
    tournamentId = json['tournamentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageURL'] = imageURL;
    data['status'] = status;
    data['dateCreate'] = dateCreate;
    data['dateUpdate'] = dateUpdate;
    data['dateDelete'] = dateDelete;
    data['tournamentId'] = tournamentId;
    return data;
  }
}