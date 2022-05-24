import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/tournament/schedule/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournamentDetailScreen extends StatelessWidget {
  TournamentDetailScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final tournamentController = Get.put(TournamentController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Obx(
      () => Stack(
        children: [
          Scaffold(
            body: Column(
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
                                "assets/images/league.png",
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
                                color: kWhiteText,
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
                            image: NetworkImage(tournamentController
                                .tournamentDetail.value.tournamentAvatar
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
                  "GIẢI ĐẤU",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: kPadding / 3,
                ),
                Text(
                  tournamentController.tournamentDetail.value.tournamentName
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
                        "Hình thức",
                        style: TextStyle(
                          color: kBlackText,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        tournamentController
                                    .tournamentDetail.value.tournamentTypeId ==
                                1
                            ? "Loại trực tiếp"
                            : tournamentController.tournamentDetail.value
                                        .tournamentTypeId ==
                                    2
                                ? "Vòng tròn"
                                : "Chia bảng đấu",
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
                        tournamentController.tournamentDetail.value.userId
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
                        "Địa điểm",
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
                          tournamentController
                              .tournamentDetail.value.footballFieldAddress
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
                        "QUẢN LÝ GIẢI ĐẤU",
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
                      children: tournamentController.listTournamentDetail
                          .map((element) {
                        return GestureDetector(
                          onTap: () {
                            generalController.isLoading.value = true;
                            if (element == "Lịch thi đấu") {
                              
                              Get.to(() => ScheduleScreen(),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 600));
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
                              style: TextStyle(color: kBlackText, fontSize: 16),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
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
              ],
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
