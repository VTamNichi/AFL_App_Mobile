import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/football_player_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/football_player/components/build_football_player_list.dart';
import 'package:amateur_football_league_mobile/screens/football_player/football_player_detail/football_player_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final footballPlayerController = Get.put(FootballPlayerController());

  final userController = Get.put(UserController());

  final generalController = Get.put(GeneralController());

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getFootballPlayerData({bool isRefresh = false}) async {
    if (!isRefresh) {
      if (generalController.currentFootballPlayerPage.value >=
          (footballPlayerController.countListFootballPlayer.value / 8).ceil()) {
        refreshController.loadNoData();
        return true;
      } else {
        generalController.currentFootballPlayerPage.value += 1;
      }
    }
    await footballPlayerController.getListFootballPlayer(isRefresh: isRefresh);
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
                      footballPlayerController.selectFootballPlayer.value = 1;
                    },
                    child: Container(
                      width: 104,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: footballPlayerController.selectFootballPlayer.value == 1
                                    ? kGreenLightColor
                                    : kBackgroundColor,
                                width: 3,
                                style: BorderStyle.solid)),
                      ),
                      child: Center(
                          child: Text(
                        "Tất cả cầu thủ",
                        style: TextStyle(
                          color: footballPlayerController.selectFootballPlayer.value == 1
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
                      footballPlayerController.selectFootballPlayer.value = 2;
                    },
                    child: Container(
                      width: 104,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: footballPlayerController.selectFootballPlayer.value == 2
                                    ? kGreenLightColor
                                    : kBackgroundColor,
                                width: 3,
                                style: BorderStyle.solid)),
                      ),
                      child: Center(
                          child: Text(
                        "Cầu thủ của tôi",
                        style: TextStyle(
                          color: footballPlayerController.selectFootballPlayer.value == 2
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
                children: footballPlayerController.listSearchFootballPlayer.map((element) {
                  return GestureDetector(
                    onTap: () {
                      //footballPlayerController.showOptionSearchFootballPlayer(context, element);
                    },
                    child: Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      margin: EdgeInsets.only(
                          left: kPadding / 2, right: kPadding / 2),
                      decoration: BoxDecoration(
                        color: 
                        // footballPlayerController.element.contains(element)
                        //     ? kGreenLightColor : 
                            kBackgroundColor,
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
                            color: 
                            // footballPlayerController.element.contains(element)
                            //     ? kWhiteText :
                                kGreyColor),
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
                  footballPlayerController.countListFootballPlayer.value.toString() + " Cầu thủ",
                  style: TextStyle(
                      color: kBlackText,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    //footballPlayerController.showOptionOrderFootballPlayer(context);
                  },
                  child: Container(
                      width: 100,
                      height: 30,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        color: footballPlayerController.sortFootballPlayerBy.value == ""
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
                              color: footballPlayerController.sortFootballPlayerBy.value == ""
                                  ? kGreyColor
                                  : kWhiteText,
                            ),
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: footballPlayerController.sortFootballPlayerBy.value == ""
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
                final result = await getFootballPlayerData(isRefresh: true);
                if (result) {
                  refreshController.refreshCompleted();
                } else {
                  refreshController.refreshFailed();
                }
              },
              onLoading: () async {
                final result = await getFootballPlayerData(isRefresh: false);
                if (result) {
                  refreshController.loadComplete();
                } else {
                  refreshController.loadFailed();
                }
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: footballPlayerController.footballPlayerList.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      footballPlayerController.footballPlayerDetail.value = footballPlayerController.footballPlayerList[index];
                      Get.to(() => FootballPlayerDetailScreen(),
                          transition: Transition.zoom,
                          duration: const Duration(milliseconds: 600));
                    },
                    child: BuildFootballPlayerList(
                      image: footballPlayerController.footballPlayerList[index].playerAvatar,
                      name: footballPlayerController.footballPlayerList[index].playerName,
                      position: footballPlayerController.footballPlayerList[index].position,
                      gender:
                          footballPlayerController.footballPlayerList[index].userVM!.gender == "Female"
                              ? "Nữ"
                              : "Nam",
                      area: footballPlayerController.footballPlayerList[index].userVM!.address,
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
