import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/football_player_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootballPlayerDetailScreen extends StatelessWidget {
  FootballPlayerDetailScreen({Key? key}) : super(key: key);

  final generalController = Get.put(GeneralController());
  final footballPlayerController = Get.put(FootballPlayerController());

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
                                  "assets/images/football_player.png",
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
                              image: NetworkImage(footballPlayerController
                                  .footballPlayerDetail.value.playerAvatar
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
                    "CẦU THỦ",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: kPadding / 3,
                  ),
                  Text(
                    footballPlayerController.footballPlayerDetail.value.playerName
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
                          "Email",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          footballPlayerController
                              .footballPlayerDetail.value.userVM!.email
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
                          footballPlayerController
                              .footballPlayerDetail.value.userVM!.phone
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
                          "Giới tính",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          footballPlayerController.footballPlayerDetail.value
                                      .userVM!.gender ==
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
                          "Vị trí thi đấu",
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Text(
                          footballPlayerController
                              .footballPlayerDetail.value.position
                              .toString() == "null" ? "Chưa chọn vị trí" : footballPlayerController
                              .footballPlayerDetail.value.position
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
                            footballPlayerController.footballPlayerDetail.value
                                        .userVM!.address
                                        .toString() ==
                                    "null"
                                ? ""
                                : footballPlayerController
                                    .footballPlayerDetail.value.userVM!.address
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
                          "THÔNG TIN CẦU THỦ",
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
                        children: footballPlayerController
                            .listFootballPlayerDetail
                            .map((element) {
                          return GestureDetector(
                            onTap: () {},
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
                  // SizedBox(
                  //   height: 100,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Row(
                  //       children: [
                  //         Text(
                  //           "TỔNG QUÁT",
                  //           style: TextStyle(
                  //             color: kBlackText,
                  //             fontSize: 16,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //         Expanded(
                  //           child: Container(),
                  //         ),
                  //         Text(
                  //           "Tất cả",
                  //           style: TextStyle(
                  //             color: kGreenLightColor,
                  //             fontSize: 16,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         "BÌNH LUẬN",
                  //         style: TextStyle(
                  //           color: kBlackText,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w500,
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: Container(),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
