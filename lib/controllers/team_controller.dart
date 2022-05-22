import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/team_api.dart';
import 'package:amateur_football_league_mobile/models/Team.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class TeamController extends GetxController {
  final generalController = Get.put(GeneralController());

  Rx<int> selectTeam = 1.obs;
  RxList<Team> teamList = <Team>[].obs;
  RxInt countListTeam = 0.obs;
  RxList listSearchTeam = [
    "Tỉnh / Thành Phố",
    "Quận / Huyện",
    "Phường / Xã",
    "Giới tính",
  ].obs;

  Future<void> getListTeam() async {
    await TeamAPI.getListTeam("", "", "", "", "");
  }

  RxString sortTeamType = "".obs;
  RxString sortTeamBy = "".obs;
  RxBool sortType = true.obs;
  RxBool sortNameType = true.obs;

  RxString nameSearchTeam = "".obs;
  RxString genderSearchTeam = "".obs;

  RxList<String> element = <String>[].obs;

  void showOptionOrderTeam(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
              height: 190,
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
                        sortTeamType.value = "order-type=ASC&";
                      } else {
                        sortTeamType.value = "order-type=DESC&";
                      }
                      sortType.value = !sortType.value;
                      sortTeamBy.value = "";
                      await TeamAPI.getListTeam(
                          nameSearchTeam.value,
                          generalController.areaSearchTeam.value,
                          genderSearchTeam.value,
                          sortTeamBy.value,
                          sortTeamType.value);
                          generalController.isLoading.value = false;
                    },
                    title: const Center(child: Text("--"))),
                Divider(color: kGreyColor, height: 3),
                ListTile(
                  onTap: () async {
                    Navigator.pop(context);
                    generalController.isLoading.value = true;
                    if (sortNameType.isTrue) {
                      sortTeamType.value = "order-type=ASC&";
                    } else {
                      sortTeamType.value = "order-type=DESC&";
                    }
                    sortNameType.value = !sortNameType.value;
                    sortTeamBy.value = "order-by=TeamName&";
                    await TeamAPI.getListTeam(
                        nameSearchTeam.value,
                        generalController.areaSearchTeam.value,
                        genderSearchTeam.value,
                        sortTeamBy.value,
                        sortTeamType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Tên giải đấu",
                      style: TextStyle(
                          color: sortTeamBy.value == "order-by=TeamName&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
              ]));
        });
  }

  void showOptionSearchTeam(
      BuildContext context, String searchTournament) async {
    generalController.nameSearchTeam.value = nameSearchTeam.value;
    generalController.genderSearchTeam.value = genderSearchTeam.value;
    generalController.sortTeamBy.value = sortTeamBy.value;
    generalController.sortTeamType.value = sortTeamType.value;
    if (searchTournament == "Giới tính") {
      showOptionGenderTournament(context);
    } else if (searchTournament == "Tỉnh / Thành Phố") {
      await generalController.showOptionArea(context, 1);
      if (generalController.elementAreaTeam.value.isNotEmpty &&
          element.where((element) => element == "Tỉnh / Thành Phố").isEmpty) {
        element.add("Tỉnh / Thành Phố");
      } else if (generalController.elementAreaTeam.value.isEmpty &&
          element
              .where((element) => element == "Tỉnh / Thành Phố")
              .isNotEmpty) {
        element.remove("Tỉnh / Thành Phố");
        element.remove("Quận / Huyện");
        element.remove("Phường / Xã");
        generalController.nameAreaDistrictTeam.value = "";
      } else if (generalController.elementAreaTeam.value.isNotEmpty &&
          element
              .where((element) => element == "Tỉnh / Thành Phố")
              .isNotEmpty) {}
    } else if (searchTournament == "Quận / Huyện") {
      if (generalController.listDistrictTeam.isNotEmpty) {
        await generalController.showOptionAreaDistrict(context, 1);
        if (generalController.elementAreaDistrictTeam.value.isNotEmpty &&
            element.where((element) => element == "Quận / Huyện").isEmpty) {
          element.add("Quận / Huyện");
        } else if (generalController.elementAreaDistrictTeam.value.isEmpty &&
            element.where((element) => element == "Quận / Huyện").isNotEmpty) {
          element.remove("Quận / Huyện");
          element.remove("Phường / Xã");
        } else if (generalController.elementAreaDistrictTeam.value.isNotEmpty &&
            element.where((element) => element == "Quận / Huyện").isNotEmpty) {}
      } else {
        Fluttertoast.showToast(
            msg: "Vui lòng chọn tỉnh / thành phố", fontSize: 18);
      }
    } else {
      if (generalController.listWardTeam.isNotEmpty) {
        await generalController.showOptionAreaWard(context, 1);
        if (generalController.elementAreaWardTeam.value.isNotEmpty &&
            element.where((element) => element == "Phường / Xã").isEmpty) {
          element.add("Phường / Xã");
        } else if (generalController.elementAreaWardTeam.value.isEmpty &&
            element.where((element) => element == "Phường / Xã").isNotEmpty) {
          element.remove("Phường / Xã");
        } else if (generalController.elementAreaWardTeam.value.isNotEmpty &&
            element.where((element) => element == "Phường / Xã").isNotEmpty) {}
      } else {
        Fluttertoast.showToast(
            msg: "Vui lòng chọn quận / huyện", fontSize: 18);
      }
    }
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
                      genderSearchTeam.value = "";
                      element.remove("Giới tính");
                      await TeamAPI.getListTeam(
                          nameSearchTeam.value,
                          generalController.areaSearchTeam.value,
                          genderSearchTeam.value,
                          sortTeamBy.value,
                          sortTeamType.value);
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
                    genderSearchTeam.value = "team-gender=Male&";
                    await TeamAPI.getListTeam(
                        nameSearchTeam.value,
                        generalController.areaSearchTeam.value,
                        genderSearchTeam.value,
                        sortTeamBy.value,
                        sortTeamType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Nam",
                      style: TextStyle(
                          color: genderSearchTeam.value == "team-gender=Male&"
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
                    genderSearchTeam.value = "team-gender=Female&";
                    await TeamAPI.getListTeam(
                        nameSearchTeam.value,
                        generalController.areaSearchTeam.value,
                        genderSearchTeam.value,
                        sortTeamBy.value,
                        sortTeamType.value);
                        generalController.isLoading.value = false;
                  },
                  title: Center(
                    child: Text(
                      "Nữ",
                      style: TextStyle(
                          color: genderSearchTeam.value == "team-gender=Female&"
                              ? kGreenLightColor
                              : kBlackText),
                    ),
                  ),
                ),
              ]));
        });
  }
}
