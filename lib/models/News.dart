class News {
  int? id;
  String? content;
  String? newsImage;
  int? tournamentId;
  bool? status;
  String? dateCreate;

  News(
      {this.id,
      this.content,
      this.newsImage,
      this.tournamentId,
      this.status,
      this.dateCreate});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    newsImage = json['newsImage'];
    tournamentId = json['tournamentId'];
    status = json['status'];
    dateCreate = json['dateCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['newsImage'] = newsImage;
    data['tournamentId'] = tournamentId;
    data['status'] = status;
    data['dateCreate'] = dateCreate;
    return data;
  }
}
