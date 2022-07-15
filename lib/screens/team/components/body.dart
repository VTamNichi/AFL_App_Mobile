import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/comment_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/team/components/build_team_list.dart';
import 'package:amateur_football_league_mobile/screens/team/team_detail/team_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final teamController = Get.put(TeamController());

  final userController = Get.put(UserController());

  final generalController = Get.put(GeneralController());
  final commentController = Get.put(CommentController());

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getTeamData({bool isRefresh = false}) async {
    if (!isRefresh) {
      if (generalController.currentTeamPage.value >=
          (teamController.countListTeam.value / 8).ceil()) {
        refreshController.loadNoData();
        return true;
      } else {
        generalController.currentTeamPage.value += 1;
      }
    }
    await teamController.getListTeam(isRefresh: isRefresh);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Column(
        children: [
          Container(
            color: kBackgroundColor,
            width: double.infinity,
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      teamController.selectTeam.value = 1;
                    },
                    child: Container(
                      width: 104,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: teamController.selectTeam.value == 1
                                    ? kGreenLightColor
                                    : kBackgroundColor,
                                width: 3,
                                style: BorderStyle.solid)),
                      ),
                      child: Center(
                          child: Text(
                        "Tất cả đội",
                        style: TextStyle(
                          color: teamController.selectTeam.value == 1
                              ? kGreenLightColor
                              : kBlackText,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      teamController.selectTeam.value = 2;
                    },
                    child: Container(
                      width: 104,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: teamController.selectTeam.value == 2
                                    ? kGreenLightColor
                                    : kBackgroundColor,
                                width: 3,
                                style: BorderStyle.solid)),
                      ),
                      child: Center(
                          child: Text(
                        "Đội của tôi",
                        style: TextStyle(
                          color: teamController.selectTeam.value == 2
                              ? kGreenLightColor
                              : kBlackText,
                          fontSize: 18,
                        ),
                      )),
                    ),
                  ),
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
                children: teamController.listSearchTeam.map((element) {
                  return GestureDetector(
                    onTap: () {
                      teamController.showOptionSearchTeam(context, element);
                    },
                    child: Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      margin: EdgeInsets.only(
                          left: kPadding / 2, right: kPadding / 2),
                      decoration: BoxDecoration(
                        color: teamController.element.contains(element)
                            ? kGreenLightColor
                            : kBackgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            color: kGreyColor,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                      child: Text(
                        element,
                        style: TextStyle(
                            color: teamController.element.contains(element)
                                ? kWhiteText
                                : kGreyColor),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: kPadding / 2, right: kPadding / 2),
            child: Row(
              children: [
                Text(
                  teamController.countListTeam.value.toString() + " Đội bóng",
                  style: TextStyle(
                      color: kBlackText,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    teamController.showOptionOrderTeam(context);
                  },
                  child: Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: teamController.sortTeamBy.value == ""
                            ? kBackgroundColor
                            : kGreenLightColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            color: kGreyColor,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Sắp xếp",
                            style: TextStyle(
                              color: teamController.sortTeamBy.value == ""
                                  ? kGreyColor
                                  : kWhiteText,
                            ),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: teamController.sortTeamBy.value == ""
                                ? kGreyColor
                                : kWhiteText,
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height - 300,
            child: SmartRefresher(
              controller: refreshController,
              enablePullUp: true,
              onRefresh: () async {
                final result = await getTeamData(isRefresh: true);
                if (result) {
                  refreshController.refreshCompleted();
                } else {
                  refreshController.refreshFailed();
                }
              },
              onLoading: () async {
                final result = await getTeamData(isRefresh: false);
                if (result) {
                  refreshController.loadComplete();
                } else {
                  refreshController.loadFailed();
                }
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: teamController.teamList.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () async {
                      teamController.teamDetail.value =
                          teamController.teamList[index];
                      generalController.searchIDComment.value = "teamID=" +
                          teamController.teamList[index].id!.toString() +
                          "&";
                      generalController.currentCommentPage.value = 1;
                      await commentController.getListComment();
                      Get.to(() => TeamDetailScreen(),
                          transition: Transition.zoom,
                          duration: const Duration(milliseconds: 600));
                    },
                    child: BuildTeamList(
                      image: teamController.teamList[index].teamAvatar,
                      name: teamController.teamList[index].teamName,
                      number: teamController.teamList[index].numberPlayerInTeam,
                      gender:
                          teamController.teamList[index].teamGender == "Female"
                              ? "Nữ"
                              : "Nam",
                      area: teamController.teamList[index].teamArea,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
