class TeamAnalysis {
  int? totalMatch;
  int? totalWin;
  int? totalLose;
  int? totalDraw;

  TeamAnalysis(
      {this.totalMatch, this.totalWin, this.totalLose, this.totalDraw});

  TeamAnalysis.fromJson(Map<String, dynamic> json) {
    totalMatch = json['totalMatch'];
    totalWin = json['totalWin'];
    totalLose = json['totalLose'];
    totalDraw = json['totalDraw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalMatch'] = totalMatch;
    data['totalWin'] = totalWin;
    data['totalLose'] = totalLose;
    data['totalDraw'] = totalDraw;
    return data;
  }
}
