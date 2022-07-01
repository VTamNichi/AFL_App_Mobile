import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/comment_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/team/team_detail/components/build_comment_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamDetailScreen extends StatelessWidget {
  TeamDetailScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final teamController = Get.put(TeamController());
  final commentController = Get.put(CommentController());

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
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          "Ban tổ chức",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          teamController.teamDetail.value.id
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
                          teamController
                                      .teamDetail.value.teamPhone.toString(),
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
                          teamController
                                      .teamDetail.value.teamGender ==
                                  "Male"
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
                          teamController
                                      .teamDetail.value.numberPlayerInTeam.toString(),
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
                            teamController
                                .teamDetail.value.teamArea
                                .toString(),
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
                        children: teamController.listTeamDetail
                            .map((element) {
                          return GestureDetector(
                            onTap: () {
                              
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
                                style: TextStyle(color: kBlackText, fontSize: 16),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text(
                            "TỔNG QUÁT",
                            style: TextStyle(
                              color: kBlackText,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            "Tất cả",
                            style: TextStyle(
                              color: kGreenLightColor,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
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
