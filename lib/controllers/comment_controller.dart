import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/comment_api.dart';
import 'package:amateur_football_league_mobile/models/Comment.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  final generalController = Get.put(GeneralController());
  final userController = Get.put(UserController());
  
  RxList<Comment> commentList = <Comment>[].obs;
  RxInt countListComment = 0.obs;


  Future<void> getListComment() async {
    generalController.isLoading.value = true;
    await CommentAPI.getListComment(
        generalController.searchIDComment.value,
        generalController.currentCommentPage.value);
    generalController.isLoading.value = false;
  }

  Future<void> postComment(String content) async {
    generalController.isLoading.value = true;
    await CommentAPI.postComment(
        generalController.searchIDComment.value,
        content, userController.user.value.id!);
    generalController.isLoading.value = false;
  }
}
