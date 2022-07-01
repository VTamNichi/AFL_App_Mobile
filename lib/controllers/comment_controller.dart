import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/comment_api.dart';
import 'package:amateur_football_league_mobile/models/Comment.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  final generalController = Get.put(GeneralController());
  
  RxList<Comment> commentList = <Comment>[].obs;
  RxInt countListComment = 0.obs;

  Future<void> getListComment({bool isRefresh = false}) async {
    generalController.isLoading.value = true;
    if (isRefresh) {
      generalController.currentCommentPage.value = 1;
    }
    await CommentAPI.getListComment(
        generalController.searchIDComment.value,
        generalController.currentCommentPage.value);
    generalController.isLoading.value = false;
  }
}
