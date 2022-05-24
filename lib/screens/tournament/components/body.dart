import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_in_match_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/screens/tournament/components/build_tournament_list.dart';
import 'package:amateur_football_league_mobile/screens/tournament/tournament_detail/tournament_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final tournamentController = Get.put(TournamentController());
  final generalController = Get.put(GeneralController());
  final teamInMatchController = Get.put(TeamInMatchController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: kBackgroundColor,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () =>
                        {tournamentController.selectTournament.value = 1},
                    child: Container(
                      width: 104,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: tournamentController
                                            .selectTournament.value ==
                                        1
                                    ? kGreenLightColor
                                    : kBackgroundColor,
                                width: 3,
                                style: BorderStyle.solid)),
                      ),
                      child: Center(
                          child: Text(
                        "Tất cả giải",
                        style: TextStyle(
                          color:
                              tournamentController.selectTournament.value == 1
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
                    onTap: () =>
                        {tournamentController.selectTournament.value = 2},
                    child: Container(
                      width: 104,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: tournamentController
                                            .selectTournament.value ==
                                        2
                                    ? kGreenLightColor
                                    : kBackgroundColor,
                                width: 3,
                                style: BorderStyle.solid)),
                      ),
                      child: Center(
                          child: Text(
                        "Giải của tôi",
                        style: TextStyle(
                          color:
                              tournamentController.selectTournament.value == 2
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
                children:
                    tournamentController.listSearchTournament.map((element) {
                  return GestureDetector(
                    onTap: () {
                      tournamentController.showOptionSearchTournament(context, element);
                    },
                    child: Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      margin: EdgeInsets.only(
                          left: kPadding / 2, right: kPadding / 2),
                      decoration: BoxDecoration(
                        color: tournamentController.element.contains(element) ? kGreenLightColor : kBackgroundColor,
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        border: Border.all(
                            color: kGreyColor,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                      child: Text(
                        element,
                        style: TextStyle(color: tournamentController.element.contains(element) ? kWhiteText : kGreyColor,),
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
                  tournamentController.countListTournament.value.toString() + " Giải đấu",
                  style: TextStyle(
                      color: kBlackText,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    tournamentController.showOptionOrderTournament(context);
                  },
                  child: Container(
                    width: 100,
                    height: 30,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      color: tournamentController.sortTourBy.value == "" ? kBackgroundColor : kGreenLightColor,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                          color: kGreyColor, width: 1, style: BorderStyle.solid),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Sắp xếp",
                          style: TextStyle(color: tournamentController.sortTourBy.value == "" ? kGreyColor : kWhiteText,),
                        ),
                        Expanded(child: Container()),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: tournamentController.sortTourBy.value == "" ? kGreyColor : kWhiteText,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height - 300,
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tournamentController.tournamentList.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () async {
                      generalController.isLoading.value = true;
                      await teamInMatchController.getListTeamInMatch(tournamentController.tournamentList[index].id!);
                      tournamentController.tournamentDetail.value = tournamentController.tournamentList[index];
                      Get.to(() => TournamentDetailScreen(),
                          transition: Transition.zoom,
                          duration: const Duration(milliseconds: 600));
                                                generalController.isLoading.value = false;
                      
                    },
                    child: BuildTournamentList(
                      image: tournamentController.tournamentList[index].tournamentAvatar,
                      name: tournamentController
                          .tournamentList[index].tournamentName,
                      gender: tournamentController
                                  .tournamentList[index].tournamentGender ==
                              "Female"
                          ? "Nữ"
                          : "Nam",
                      type: tournamentController
                          .tournamentList[index].tournamentTypeId == 1 ? "Loại trực tiếp" : tournamentController
                          .tournamentList[index].tournamentTypeId == 2 ? "Đấu vòng tròn" : "Chia bảng",
                      area: tournamentController
                          .tournamentList[index].footballFieldAddress,
                    ),
                  );
                },
              ),
            ),
          ),
          // Container(
          //   width: 100,
          //   height: 10,
          //   decoration: BoxDecoration(
          //             color: kBackgroundColor,
          //             borderRadius: const BorderRadius.all(Radius.circular(8)),
          //             border: Border.all(
          //                 color: kGreenLightColor,
          //                 width: 1,
          //                 style: BorderStyle.solid),
          //           ),
          //   child: LinearProgressIndicator(
          //     value: 50,
          //     valueColor: AlwaysStoppedAnimation(kGreenLightColor),
          //     backgroundColor: kGreyBackground,
          //   ),
          // ),
        ],
      ),
    );
  }
}
