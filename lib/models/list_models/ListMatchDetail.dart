import '../MatchDetail.dart';

class ListMatchDetail {
  List<MatchDetail>? matchDetails;

  ListMatchDetail({this.matchDetails});

  ListMatchDetail.fromJson(Map<String, dynamic> json) {
    if (json['matchDetails'] != null) {
      matchDetails = <MatchDetail>[];
      json['matchDetails'].forEach((v) {
        matchDetails!.add(MatchDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matchDetails != null) {
      data['matchDetails'] = matchDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}