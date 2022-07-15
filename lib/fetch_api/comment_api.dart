import 'dart:convert';
import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/comment_controller.dart';
import 'package:amateur_football_league_mobile/models/Comment.dart';
import 'package:amateur_football_league_mobile/models/list_models/ListComment.dart';
// ignore: library_prefixes
import 'package:get/get.dart' as GetX;
import 'package:http/http.dart' as http;

class CommentAPI {
  static Future<int> getListComment(String searchID, int currentCommentPage) async {
    final commentController = GetX.Get.put(CommentController());
    int rs = 0;
    try {
      if(currentCommentPage == 0) {
        currentCommentPage = 1;
      }
      final response = await http.get(
          Uri.parse(urlApi +
              "Comment?" +
              searchID +
              "orderType=DESC&pageIndex="+ currentCommentPage.toString() +"&limit=8"),
          headers: <String, String>{
            HttpHeaders.contentTypeHeader: 'application/json',
          });
      if (response.statusCode == 200) {
        var bodyJson = json.decode(utf8.decode(response.bodyBytes));
        ListComment listComment = ListComment.fromJson(bodyJson);
        if(currentCommentPage > 1) {
          commentController.commentList.addAll(listComment.comments!);
        }
        else {
          commentController.commentList.value = listComment.comments!;
        }
        commentController.countListComment.value = listComment.countList!;
      }
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }

  static Future<int> postComment(String postCommentId, String content, int userId) async {
    int rs = 0;
    postCommentId = postCommentId.split("&")[0];
    if(postCommentId.contains("tou")) {
      postCommentId = postCommentId.replaceFirst("tou", "tour");
    }
    try {
      final Map<String, dynamic> data = <String, dynamic>{};
      data["content"] = content;
      data["dateCreate"] = "10-10-2000";
      data["dateDelete"] = "10-10-2000";
      data["dateUpdate"] = "10-10-2000";
      data["status"] = "";
      data["teamId"] = 0;
      data["tournamentId"] = 0;
      data["userId"] = userId;
      final response = await http.post(
        Uri.parse(urlApi + "Comment?" + postCommentId),
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(data),
      );
      rs = response.statusCode;
    } catch (e) {
      return rs;
    }
    return rs;
  }
}
