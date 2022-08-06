import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/comment_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/tournament/schedule/schedule_screen.dart';
import 'package:amateur_football_league_mobile/screens/tournament/tournament_detail/components/build_comment_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournamentDetailScreen extends StatefulWidget {
  TournamentDetailScreen({Key? key}) : super(key: key);

  @override
  State<TournamentDetailScreen> createState() => _TournamentDetailScreenState();
}

class _TournamentDetailScreenState extends State<TournamentDetailScreen> {
  final generalController = Get.put(GeneralController());
  final userController = Get.put(UserController());
  final tournamentController = Get.put(TournamentController());
  final commentController = Get.put(CommentController());
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
                          tournamentController.tournamentDetail.value
                                      .tournamentTypeId ==
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
                            "THÔNG TIN GIẢI ĐẤU",
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
                    padding: EdgeInsets.fromLTRB(kPadding, 0, kPadding, kPadding),
                    child: Row(
                      children: [
                        Text(
                          tournamentController.tournamentDetail.value.description!
                              .replaceAll(regExp, ""),
                          style: TextStyle(
                            color: kBlackText,
                            fontSize: 20,
                          ),
                        ),
                        Expanded(child: Container()),
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
