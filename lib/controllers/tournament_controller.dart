import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/tournament_api.dart';
import 'package:amateur_football_league_mobile/models/Tournament.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class TournamentController extends GetxController {
  final generalController = Get.put(GeneralController());

  Rx<int> selectTournament = 1.obs;
  RxList<Tournament> tournamentList = <Tournament>[].obs;
  Rx<Tournament> tournamentDetail = Tournament().obs;

  RxInt countListTournament = 0.obs;
  RxList listSearchTournament = [
    "Tỉnh / Thành Phố",
    "Quận / Huyện",
    "Phường / Xã",
    "Hình thức",
    "Loại giải đấu",
    "Loại sân",
    "Giới tính",
  ].obs;
  RxList listTournamentDetail = [
    "Lịch thi đấu",
    "Bảng xếp hạng",
    "Đội thi đấu",
    "Thống kê",
  ].obs;

  RxString sortTourBy = "".obs;
  RxString sortTourType = "".obs;
  RxBool sortType = true.obs;
  RxBool sortNameType = true.obs;
  RxBool sortModeType = true.obs;
  RxBool sortDateType = true.obs;

  RxString nameSearchTour = "".obs;
  RxString modeSearchTour = "".obs;
  RxString typeSearchTour = "".obs;
  RxString footballFieldSearchTour = "".obs;
  RxString genderSearchTour = "".obs;

  RxList<String> element = <String>[].obs;

  Future<void> getListTournament() async {
    await TournamentAPI.getListTournament("", "", "", "", "", "", "", "");
  }

  void showOptionOrderTournament(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
              height: 290,
              child: Column(children: <Widget>[
                Container(
                  height: 50,
                  width: double.infinity,
                  color: kGreenLightColor,
                  alignment: Alignment.center,
                  child: Text(
                    "Sắp xếp theo",
                    style: TextStyle(
                        color: kWhiteText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      generalController.isLoading.value = true;
                      if (sortType.isTrue) {
                        sortTourType.value = "order-type=ASC&";
                      } else {
                        sortTourType.value = "order-type=DESC&";
                      }
                      sortType.value = !sortType.value;
                      sortTourBy.value = "";
                      await TournamentAPI.getListTournament(
                          nameSearchTour.value,
                          generalController.areaSearchTour.value,
                          modeSearchTour.value,
                          typeSearchTour.value,
                          genderSearchTour.value,
                          footballFieldSearchTour.value,
                          sortTourBy.value,
                          sortTourType.value);
                          generalController.isLoading.value = false;
                    },
                    title: const Center(child: Text("--"))),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    generalController.isLoading.value = true;
                    if (sortNameType.isTrue) {
                      sortTourType.value = "order-type=ASC&";
                    } else {
                      sortTourType.value = "order-type=DESC&";
                    }
                    sortNameType.value = !sortNameType.value;
                    sortTourBy.value = "order-by=TournamentName&";
                    await TournamentAPI.getListTournament(
                        nameSearchTour.value,
                        generalController.areaSearchTour.value,
                        modeSearchTour.value,
                        typeSearchTour.value,
                        genderSearchTour.value,
                        footballFieldSearchTour.value,
                        sortTourBy.value,
                        sortTourType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Tên giải đấu",
                      style: TextStyle(
                          color: sortTourBy.value == "order-by=TournamentName&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    generalController.isLoading.value = true;
                    if (sortModeType.isTrue) {
                      sortTourType.value = "order-type=ASC&";
                    } else {
                      sortTourType.value = "order-type=DESC&";
                    }
                    sortModeType.value = !sortNameType.value;
                    sortTourBy.value = "order-by=Mode&";
                    await TournamentAPI.getListTournament(
                        nameSearchTour.value,
                        generalController.areaSearchTour.value,
                        modeSearchTour.value,
                        typeSearchTour.value,
                        genderSearchTour.value,
                        footballFieldSearchTour.value,
                        sortTourBy.value,
                        sortTourType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Loại giải đấu",
                      style: TextStyle(
                          color: sortTourBy.value == "order-by=Mode&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      generalController.isLoading.value = true;
                      if (sortDateType.isTrue) {
                        sortTourType.value = "order-type=ASC&";
                      } else {
                        sortTourType.value = "order-type=DESC&";
                      }
                      sortDateType.value = !sortNameType.value;
                      sortTourBy.value = "order-by=DateCreate&";
                      await TournamentAPI.getListTournament(
                          nameSearchTour.value,
                          generalController.areaSearchTour.value,
                          modeSearchTour.value,
                          typeSearchTour.value,
                          genderSearchTour.value,
                          footballFieldSearchTour.value,
                          sortTourBy.value,
                          sortTourType.value);
                          generalController.isLoading.value = false;
                    },
                    title: Center(
                        child: Text(
                      "Ngày tạo giải",
                      style: TextStyle(
                          color: sortTourBy.value == "order-by=DateCreate&"
                              ? kGreenLightColor
                              : kBlackText),
                    ))),
              ]));
        });
  }

  void showOptionSearchTournament(
      BuildContext context, String searchTournament) async {
    generalController.nameSearchTour.value = nameSearchTour.value;
    generalController.modeSearchTour.value = modeSearchTour.value;
    generalController.typeSearchTour.value = typeSearchTour.value;
    generalController.genderSearchTour.value = genderSearchTour.value;
    generalController.footballFieldSearchTour.value = footballFieldSearchTour.value;
    generalController.sortTourBy.value = sortTourBy.value;
    generalController.sortTourType.value = sortTourType.value;

    if (searchTournament == "Tỉnh / Thành Phố") {
      await generalController.showOptionArea(context, 2);
      if (generalController.elementAreaTour.value.isNotEmpty &&
          element.where((element) => element == "Tỉnh / Thành Phố").isEmpty) {
        element.add("Tỉnh / Thành Phố");
      } else if (generalController.elementAreaTour.value.isEmpty &&
          element
              .where((element) => element == "Tỉnh / Thành Phố")
              .isNotEmpty) {
        element.remove("Tỉnh / Thành Phố");
        element.remove("Quận / Huyện");
        element.remove("Phường / Xã");
        generalController.nameAreaDistrictTour.value = "";
      } else if (generalController.elementAreaTour.value.isNotEmpty &&
          element
              .where((element) => element == "Tỉnh / Thành Phố")
              .isNotEmpty) {}
    } else if (searchTournament == "Quận / Huyện") {
      if (generalController.listDistrictTour.isNotEmpty) {
        await generalController.showOptionAreaDistrict(context, 2);
        if (generalController.elementAreaDistrictTour.value.isNotEmpty &&
            element.where((element) => element == "Quận / Huyện").isEmpty) {
          element.add("Quận / Huyện");
        } else if (generalController.elementAreaDistrictTour.value.isEmpty &&
            element.where((element) => element == "Quận / Huyện").isNotEmpty) {
          element.remove("Quận / Huyện");
          element.remove("Phường / Xã");
        } else if (generalController.elementAreaDistrictTour.value.isNotEmpty &&
            element.where((element) => element == "Quận / Huyện").isNotEmpty) {}
      } else {
        Fluttertoast.showToast(
            msg: "Vui lòng chọn tỉnh / thành phố", fontSize: 18);
      }
    } else if (searchTournament == "Phường / Xã") {
      if (generalController.listWardTour.isNotEmpty) {
        await generalController.showOptionAreaWard(context, 2);
        if (generalController.elementAreaWardTour.value.isNotEmpty &&
            element.where((element) => element == "Phường / Xã").isEmpty) {
          element.add("Phường / Xã");
        } else if (generalController.elementAreaWardTour.value.isEmpty &&
            element.where((element) => element == "Phường / Xã").isNotEmpty) {
          element.remove("Phường / Xã");
        } else if (generalController.elementAreaWardTour.value.isNotEmpty &&
            element.where((element) => element == "Phường / Xã").isNotEmpty) {}
      } else {
        Fluttertoast.showToast(msg: "Vui lòng chọn quận / huyện", fontSize: 18);
      }
    } else if (searchTournament == "Hình thức") {
      showOptionModeTournament(context);
    } else if (searchTournament == "Loại giải đấu") {
      showOptionTypeTournament(context);
    } else if (searchTournament == "Loại sân") {
      showOptionFootballFieldTournament(context);
    } else {
      showOptionGenderTournament(context);
    }
  }

  void showOptionModeTournament(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
              height: 240,
              child: Column(children: <Widget>[
                Container(
                  height: 50,
                  width: double.infinity,
                  color: kGreenLightColor,
                  alignment: Alignment.center,
                  child: Text(
                    "Chọn giá trị",
                    style: TextStyle(
                        color: kWhiteText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      generalController.isLoading.value = true;
                      modeSearchTour.value = "";
                      element.remove("Hình thức");
                      await TournamentAPI.getListTournament(
                          nameSearchTour.value,
                          generalController.areaSearchTour.value,
                          modeSearchTour.value,
                          typeSearchTour.value,
                          genderSearchTour.value,
                          footballFieldSearchTour.value,
                          sortTourBy.value,
                          sortTourType.value);
                          generalController.isLoading.value = false;
                    },
                    title: const Center(child: Text("--"))),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      generalController.isLoading.value = true;
                      modeSearchTour.value = "tournament-mode=PUBLIC&";
                      if (element
                          .where((element) => element == "Hình thức")
                          .isEmpty) {
                        element.add("Hình thức");
                      }
                      await TournamentAPI.getListTournament(
                          nameSearchTour.value,
                          generalController.areaSearchTour.value,
                          modeSearchTour.value,
                          typeSearchTour.value,
                          genderSearchTour.value,
                          footballFieldSearchTour.value,
                          sortTourBy.value,
                          sortTourType.value);
                          generalController.isLoading.value = false;
                    },
                    title: Center(
                        child: Text(
                      "Công khai",
                      style: TextStyle(
                          color:
                              modeSearchTour.value == "tournament-mode=PUBLIC&"
                                  ? kGreenLightColor
                                  : kBlackText),
                    ))),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      generalController.isLoading.value = true;
                      if (element
                          .where((element) => element == "Hình thức")
                          .isEmpty) {
                        element.add("Hình thức");
                      }
                      modeSearchTour.value = "tournament-mode=PRIVATE&";
                      await TournamentAPI.getListTournament(
                          nameSearchTour.value,
                          generalController.areaSearchTour.value,
                          modeSearchTour.value,
                          typeSearchTour.value,
                          genderSearchTour.value,
                          footballFieldSearchTour.value,
                          sortTourBy.value,
                          sortTourType.value);
                          generalController.isLoading.value = false;
                    },
                    title: Center(
                        child: Text(
                      "Nội bộ",
                      style: TextStyle(
                          color:
                              modeSearchTour.value == "tournament-mode=PRIVATE&"
                                  ? kGreenLightColor
                                  : kBlackText),
                    ))),
              ]));
        });
  }

  void showOptionTypeTournament(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
              height: 290,
              child: Column(children: <Widget>[
                Container(
                  height: 50,
                  width: double.infinity,
                  color: kGreenLightColor,
                  alignment: Alignment.center,
                  child: Text(
                    "Chọn giá trị",
                    style: TextStyle(
                        color: kWhiteText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      generalController.isLoading.value = true;
                      typeSearchTour.value = "";
                      element.remove("Loại giải đấu");
                      await TournamentAPI.getListTournament(
                          nameSearchTour.value,
                          generalController.areaSearchTour.value,
                          modeSearchTour.value,
                          typeSearchTour.value,
                          genderSearchTour.value,
                          footballFieldSearchTour.value,
                          sortTourBy.value,
                          sortTourType.value);
                          generalController.isLoading.value = false;
                    },
                    title: const Center(child: Text("--"))),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    generalController.isLoading.value = true;
                    if (element
                        .where((element) => element == "Loại giải đấu")
                        .isEmpty) {
                      element.add("Loại giải đấu");
                    }
                    typeSearchTour.value = "tournament-type=KnockoutStage&";
                    await TournamentAPI.getListTournament(
                        nameSearchTour.value,
                        generalController.areaSearchTour.value,
                        modeSearchTour.value,
                        typeSearchTour.value,
                        genderSearchTour.value,
                        footballFieldSearchTour.value,
                        sortTourBy.value,
                        sortTourType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Loại trực tiếp",
                      style: TextStyle(
                          color: typeSearchTour.value ==
                                  "tournament-type=KnockoutStage&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    generalController.isLoading.value = true;
                    if (element
                        .where((element) => element == "Loại giải đấu")
                        .isEmpty) {
                      element.add("Loại giải đấu");
                    }
                    typeSearchTour.value = "tournament-type=CircleStage&";
                    await TournamentAPI.getListTournament(
                        nameSearchTour.value,
                        generalController.areaSearchTour.value,
                        modeSearchTour.value,
                        typeSearchTour.value,
                        genderSearchTour.value,
                        footballFieldSearchTour.value,
                        sortTourBy.value,
                        sortTourType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Vòng tròn",
                      style: TextStyle(
                          color: typeSearchTour.value ==
                                  "tournament-type=CircleStage&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    generalController.isLoading.value = true;
                    if (element
                        .where((element) => element == "Loại giải đấu")
                        .isEmpty) {
                      element.add("Loại giải đấu");
                    }
                    typeSearchTour.value = "tournament-type=GroupStage&";
                    await TournamentAPI.getListTournament(
                        nameSearchTour.value,
                        generalController.areaSearchTour.value,
                        modeSearchTour.value,
                        typeSearchTour.value,
                        genderSearchTour.value,
                        footballFieldSearchTour.value,
                        sortTourBy.value,
                        sortTourType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Chia bảng đấu",
                      style: TextStyle(
                          color: typeSearchTour.value ==
                                  "tournament-type=GroupStage&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
              ]));
        });
  }

  void showOptionFootballFieldTournament(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
              height: 290,
              child: Column(children: <Widget>[
                Container(
                  height: 50,
                  width: double.infinity,
                  color: kGreenLightColor,
                  alignment: Alignment.center,
                  child: Text(
                    "Chọn giá trị",
                    style: TextStyle(
                        color: kWhiteText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      generalController.isLoading.value = true;
                      element.remove("Loại sân");
                      footballFieldSearchTour.value = "";
                      await TournamentAPI.getListTournament(
                          nameSearchTour.value,
                          generalController.areaSearchTour.value,
                          modeSearchTour.value,
                          typeSearchTour.value,
                          genderSearchTour.value,
                          footballFieldSearchTour.value,
                          sortTourBy.value,
                          sortTourType.value);
                          generalController.isLoading.value = false;
                    },
                    title: const Center(child: Text("--"))),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    generalController.isLoading.value = true;
                    if (element
                        .where((element) => element == "Loại sân")
                        .isEmpty) {
                      element.add("Loại sân");
                    }
                    footballFieldSearchTour.value =
                        "tournament-football-type=Field5&";
                    await TournamentAPI.getListTournament(
                        nameSearchTour.value,
                        generalController.areaSearchTour.value,
                        modeSearchTour.value,
                        typeSearchTour.value,
                        genderSearchTour.value,
                        footballFieldSearchTour.value,
                        sortTourBy.value,
                        sortTourType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Sân 5",
                      style: TextStyle(
                          color: footballFieldSearchTour.value ==
                                  "tournament-football-type=Field5&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    generalController.isLoading.value = true;
                    if (element
                        .where((element) => element == "Loại sân")
                        .isEmpty) {
                      element.add("Loại sân");
                    }
                    footballFieldSearchTour.value =
                        "tournament-football-type=Field7&";
                    await TournamentAPI.getListTournament(
                        nameSearchTour.value,
                        generalController.areaSearchTour.value,
                        modeSearchTour.value,
                        typeSearchTour.value,
                        genderSearchTour.value,
                        footballFieldSearchTour.value,
                        sortTourBy.value,
                        sortTourType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Sân 7",
                      style: TextStyle(
                          color: footballFieldSearchTour.value ==
                                  "tournament-football-type=Field7&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    generalController.isLoading.value = true;
                    if (element
                        .where((element) => element == "Loại sân")
                        .isEmpty) {
                      element.add("Loại sân");
                    }
                    footballFieldSearchTour.value =
                        "tournament-football-type=Field11&";
                    await TournamentAPI.getListTournament(
                        nameSearchTour.value,
                        generalController.areaSearchTour.value,
                        modeSearchTour.value,
                        typeSearchTour.value,
                        genderSearchTour.value,
                        footballFieldSearchTour.value,
                        sortTourBy.value,
                        sortTourType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Sân 11",
                      style: TextStyle(
                          color: footballFieldSearchTour.value ==
                                  "tournament-football-type=Field11&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
              ]));
        });
  }

  void showOptionGenderTournament(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
              height: 240,
              child: Column(children: <Widget>[
                Container(
                  height: 50,
                  width: double.infinity,
                  color: kGreenLightColor,
                  alignment: Alignment.center,
                  child: Text(
                    "Chọn giá trị",
                    style: TextStyle(
                        color: kWhiteText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                    onTap: () async {
                      Navigator.pop(context);
                      generalController.isLoading.value = true;
                      element.remove("Giới tính");
                      genderSearchTour.value = "";
                      await TournamentAPI.getListTournament(
                          nameSearchTour.value,
                          generalController.areaSearchTour.value,
                          modeSearchTour.value,
                          typeSearchTour.value,
                          genderSearchTour.value,
                          footballFieldSearchTour.value,
                          sortTourBy.value,
                          sortTourType.value);
                          generalController.isLoading.value = false;
                    },
                    title: const Center(child: Text("--"))),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    generalController.isLoading.value = true;
                    if (element
                        .where((element) => element == "Giới tính")
                        .isEmpty) {
                      element.add("Giới tính");
                    }
                    genderSearchTour.value = "tournament-gender=Male&";
                    await TournamentAPI.getListTournament(
                        nameSearchTour.value,
                        generalController.areaSearchTour.value,
                        modeSearchTour.value,
                        typeSearchTour.value,
                        genderSearchTour.value,
                        footballFieldSearchTour.value,
                        sortTourBy.value,
                        sortTourType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Nam",
                      style: TextStyle(
                          color: genderSearchTour.value ==
                                  "tournament-gender=Male&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    generalController.isLoading.value = true;
                    if (element
                        .where((element) => element == "Giới tính")
                        .isEmpty) {
                      element.add("Giới tính");
                    }
                    genderSearchTour.value = "tournament-gender=Female&";
                    await TournamentAPI.getListTournament(
                        nameSearchTour.value,
                        generalController.areaSearchTour.value,
                        modeSearchTour.value,
                        typeSearchTour.value,
                        genderSearchTour.value,
                        footballFieldSearchTour.value,
                        sortTourBy.value,
                        sortTourType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Nữ",
                      style: TextStyle(
                          color: genderSearchTour.value ==
                                  "tournament-gender=Female&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
              ]));
        });
  }
}
