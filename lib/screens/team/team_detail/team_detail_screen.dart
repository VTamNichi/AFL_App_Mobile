import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/comment_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/player_in_team_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_tournament_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/team/team_detail/components/build_comment_list.dart';
import 'package:amateur_football_league_mobile/screens/team/team_detail/player_in_team/player_in_team_screen.dart';
import 'package:amateur_football_league_mobile/screens/team/team_detail/team_analysis/team_analysis_screen.dart';
import 'package:amateur_football_league_mobile/screens/team/team_detail/tournament_of_team/tournament_of_team_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamDetailScreen extends StatelessWidget {
  TeamDetailScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final userController = Get.put(UserController());
  final teamController = Get.put(TeamController());
  final commentController = Get.put(CommentController());
  final playerInTeamController = Get.put(PlayerInTeamController());
  final teamInTournamentController = Get.put(TeamInTournamentController());

  TextEditingController textCommentController = TextEditingController();
  RegExp regExp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Obx(
      () => Stack(
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 260,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: size.width,
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/team.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 10,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: kBlackText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: size.width / 2 - 50,
                          top: 150,
                          child: ClipOval(
                            child: Image(
                              image: NetworkImage(teamController
                                  .teamDetail.value.teamAvatar
                                  .toString()),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Text(
                    "ĐỘI BÓNG",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: kPadding / 3,
                  ),
                  Text(
                    teamController.teamDetail.value.teamName
                        .toString()
                        .toUpperCase(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Divider(
                    color: kGreyColor,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Chủ đội bóng",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          userController.userById.value.username!,
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: kGreyColor,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Số điện thoại liên lạc",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          teamController.teamDetail.value.teamPhone.toString(),
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: kGreyColor,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Giới tính đội",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          teamController.teamDetail.value.teamGender == "Male"
                              ? "Nam"
                              : "Nữ",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: kGreyColor,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Số lượng thành viên",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          teamController.teamDetail.value.numberPlayerInTeam
                              .toString(),
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: kGreyColor,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Khu vực hoạt động",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            teamController.teamDetail.value.teamArea.toString(),
                            maxLines: 4,
                            style: TextStyle(
                              color: kBlackText,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kPadding / 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "QUẢN LÝ ĐỘI BÓNG",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: kBackgroundColor,
                    alignment: Alignment.centerLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: teamController.listTeamDetail.map((element) {
                          return GestureDetector(
                            onTap: () async {
                              generalController.isLoading.value = true;
                              if (element == "Thành viên") {
                                playerInTeamController.teamId.value =
                                    teamController.teamDetail.value.id!;
                                Get.to(() => PlayerInTeamScreen(),
                                    transition: Transition.rightToLeft,
                                    duration:
                                        const Duration(milliseconds: 600));
                              } else if (element == "Giải đấu") {
                                teamInTournamentController.teamId.value =
                                    teamController.teamDetail.value.id!;
                                Get.to(() => TournamentOfTeamScreen(),
                                    transition: Transition.rightToLeft,
                                    duration:
                                        const Duration(milliseconds: 600));
                              } else {
                                await teamController.getTeamAnalysis();
                                await teamController.getTeamAnalysis2();
                                Get.to(() => TeamAnalysisScreen(),
                                    transition: Transition.rightToLeft,
                                    duration:
                                        const Duration(milliseconds: 600));
                              }
                              generalController.isLoading.value = false;
                            },
                            child: Container(
                              height: 30,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              margin: EdgeInsets.only(
                                  left: kPadding / 2, right: kPadding / 2),
                              decoration: BoxDecoration(
                                color: kGreyColorD,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    color: kGreyColorD,
                                    width: 1,
                                    style: BorderStyle.solid),
                              ),
                              child: Text(
                                element,
                                style:
                                    TextStyle(color: kBlackText, fontSize: 16),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "GIỚI THIỆU ĐỘI BÓNG",
                            style: TextStyle(
                              color: kBlackText,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.fromLTRB(kPadding, 0, kPadding, kPadding),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            teamController.teamDetail.value.description!
                                .replaceAll(regExp, ""),
                            style: TextStyle(
                              color: kBlackText,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "BÌNH LUẬN",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(kPadding / 2),
                    child: TextField(
                      controller: textCommentController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Viết bình luận",
                        labelStyle: TextStyle(color: kGreyColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        kPadding / 2, 0, kPadding / 2, kPadding / 2),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        ElevatedButton(
                          onPressed: () async {
                            await commentController
                                .postComment(textCommentController.text);
                            textCommentController.text = "";
                            await commentController.getListComment();
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  kGreenLightColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ))),
                          child: Text(
                            "Đăng",
                            style: TextStyle(color: kWhiteText, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: commentController.commentList.length,
                    itemBuilder: (BuildContext context, index) {
                      return GestureDetector(
                        onTap: () async {},
                        child: BuildCommentList(
                          image:
                              commentController.commentList[index].user!.avatar,
                          name: commentController
                              .commentList[index].user!.username,
                          content: commentController.commentList[index].content,
                          date: commentController.commentList[index].dateCreate,
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(kPadding / 2),
                    child: Row(
                      children: [
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () async {
                            generalController.currentCommentPage.value++;
                            await commentController.getListComment();
                          },
                          child: Text(
                            "Xem nhiều bình luận",
                            style: TextStyle(
                                color: kGreenLightColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: kPadding * 1.5,
                  ),
                ],
              ),
            ),
          ),
          generalController.isLoading.value
              ? const LoadingScreen()
              : Container(),
        ],
      ),
    ));
  }
}
