import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/comment_controller.dart';
import 'package:amateur_football_league_mobile/controllers/football_player_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/football_player/football_player_detail/team_joining/components/build_team_joinning.dart';
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
  final generalController = Get.put(GeneralController());
  final footballPlayerController = Get.put(FootballPlayerController());

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Container(
        height: size.height - 90,
        margin: EdgeInsets.only(top: kPadding / 3),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: footballPlayerController.listTeamJoining.length,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () async {
                // teamController.teamDetail.value =
                //     teamController.teamList[index];
                // generalController.searchIDComment.value = "teamID=" +
                //     teamController.teamList[index].id!.toString() +
                //     "&";
                // generalController.currentCommentPage.value = 1;
                // await commentController.getListComment();
                // await userController
                //     .getUserById(teamController.teamList[index].id!);
                // Get.to(() => TeamJoiningDetailScreen(),
                //     transition: Transition.zoom,
                //     duration: const Duration(milliseconds: 600));
              },
              child: BuildTeamJoiningList(
                image: footballPlayerController
                    .listTeamJoining[index].team!.teamAvatar,
                name: footballPlayerController
                    .listTeamJoining[index].team!.teamName,
                gender: footballPlayerController
                            .listTeamJoining[index].team!.teamGender ==
                        "Female"
                    ? "Nữ"
                    : "Nam",
                area: footballPlayerController
                    .listTeamJoining[index].team!.teamArea,
              ),
            );
          },
        ),
      ),
    );
  }
}
