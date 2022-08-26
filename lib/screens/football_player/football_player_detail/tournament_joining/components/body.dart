import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/football_player_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/screens/football_player/football_player_detail/tournament_joining/components/build_tournament_joining.dart';
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
          itemCount: footballPlayerController.listTournamentJoining.length,
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
              child: BuildTournamentJoiningList(
                image: footballPlayerController.listTournamentJoining[index].tournamentAvatar!,
                name: footballPlayerController.listTournamentJoining[index].tournamentName,
                gender: footballPlayerController.listTournamentJoining[index].tournamentGender ==
                        "Female"
                    ? "Nữ"
                    : "Nam",
                type: footballPlayerController.listTournamentJoining[index].tournamentTypeId ==
                              1
                          ? "Loại trực tiếp"
                          : footballPlayerController.listTournamentJoining[index].tournamentTypeId ==
                                  2
                              ? "Đấu vòng tròn"
                              : "Chia bảng",
                area: footballPlayerController.listTournamentJoining[index].footballFieldAddress,
              ),
            );
          },
        ),
      ),
    );
  }
}
