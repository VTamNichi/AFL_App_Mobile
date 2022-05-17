import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/screens/team/components/build_team_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final teamController = Get.put(TeamController());

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
                    onTap: () => {teamController.selectTeam.value = 1},
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
                    onTap: () => {teamController.selectTeam.value = 2},
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
                  return Container(
                    height: 30,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    margin: EdgeInsets.only(left: kPadding/2, right: kPadding/2),
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: const BorderRadius.all( Radius.circular(8)),
                      border: Border.all(
                          color: kGreyColor,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    child: Text(element, style: TextStyle(color: kGreyColor),),
                    );
                }).toList(),
              ),
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: kPadding/2, right: kPadding/2),
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
                Container(
                    width: 100,
                    height: 30,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
                      borderRadius: const BorderRadius.all( Radius.circular(8)),
                      border: Border.all(
                          color: kGreyColor,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    child: Row(
                      children: [
                        Text("Sắp xếp", style: TextStyle(color: kGreyColor),),
                        Expanded(child: Container()),
                        Icon(Icons.keyboard_arrow_down, color: kGreyColor,)
                      ],
                    )
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
                itemCount: teamController.teamList.length,
                itemBuilder: (BuildContext context, index) {
                  return BuildTeamList(
                    image: teamController.teamList[index].teamAvatar,
                    name: teamController.teamList[index].teamName,
                    number: teamController.teamList[index].numberPlayerInTeam,
                    gender:
                        teamController.teamList[index].teamGender == "Female"
                            ? "Nữ"
                            : "Nam",
                    area: teamController.teamList[index].teamArea,
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
