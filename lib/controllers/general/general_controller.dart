import 'dart:io';
import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/fetch_api/general_api.dart';
import 'package:amateur_football_league_mobile/fetch_api/team_api.dart';
import 'package:amateur_football_league_mobile/fetch_api/tournament_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:amateur_football_league_mobile/models/general_models/Province';

class GeneralController extends GetxController {
  RxInt currentTournamentPage = 0.obs;
  RxInt currentTeamPage = 0.obs;
  RxInt currentNotificationPage = 0.obs;
  RxInt currentFootballPlayerPage = 0.obs;
  RxInt currentCommentPage = 1.obs;
  RxInt currentNewsPage = 0.obs;
  RxInt currentImagesPage = 0.obs; 

  RxString searchIDComment = "".obs;

  RxInt currentIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isSearchTour = true.obs;
  RxString userIDSearchTour = "".obs;

  RxString emailLogin = "".obs;

  RxList<Province> listProvince = <Province>[].obs;
  Rx<File> imageRegister = File('').obs;
  Rx<File> imageUpdate = File('').obs;
  RxBool emptyDOB = false.obs;
  Rx<DateTime> dob = DateTime.now().obs;
  Rx<DateTime> dobUpdatePick = DateTime.now().obs;

  // search team variables
  RxString elementAreaTeam = "".obs;
  RxString elementAreaDistrictTeam = "".obs;
  RxString elementAreaWardTeam = "".obs;
  RxList<Districts> listDistrictTeam = <Districts>[].obs;
  RxList<Wards> listWardTeam = <Wards>[].obs;

  RxString nameAreaTeam = "".obs;
  RxString nameAreaDistrictTeam = "".obs;
  RxString nameAreaWardTeam = "".obs;

  RxString nameSearchTeam = "".obs;
  RxString areaSearchTeam = "".obs;
  RxString genderSearchTeam = "".obs;
  RxString sortTeamBy = "".obs;
  RxString sortTeamType = "".obs;

// search tour variables
  RxString elementAreaTour = "".obs;
  RxString elementAreaDistrictTour = "".obs;
  RxString elementAreaWardTour = "".obs;
  RxList<Districts> listDistrictTour = <Districts>[].obs;
  RxList<Wards> listWardTour = <Wards>[].obs;

  RxString nameAreaTour = "".obs;
  RxString nameAreaDistrictTour = "".obs;
  RxString nameAreaWardTour = "".obs;

  RxString nameSearchTour = "".obs;
  RxString areaSearchTour = "".obs;
  RxString modeSearchTour = "".obs;
  RxString typeSearchTour = "".obs;
  RxString genderSearchTour = "".obs;
  RxString footballFieldSearchTour = "".obs;
  RxString sortTourBy = "".obs;
  RxString sortTourType = "".obs;

  void showOptionImage(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
              height: 120,
              child: Column(children: <Widget>[
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.camera, index);
                    },
                    leading: const Icon(Icons.photo_camera),
                    title: const Text("Chụp ảnh từ camera")),
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      pickImage(ImageSource.gallery, index);
                    },
                    leading: const Icon(Icons.photo_library),
                    title: const Text("Chọn ảnh trong máy"))
              ]));
        });
  }

  Future pickImage(ImageSource source, index) async {
    try {
      final pImage = await ImagePicker().pickImage(source: source);
      if (pImage == null) return;

      final imageTemp = File(pImage.path);
      if (index == 1) {
        imageRegister.value = imageTemp;
      } else {
        imageUpdate.value = imageTemp;
      }
    } on PlatformException {
      throw Exception("Không chọn được ảnh");
    }
  }

  Future pickDate(BuildContext context, index) async {
    final initialDate = DateTime.parse("2000-01-01");
    final newDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(initialDate.year + 20));

    if (newDate == null) return;
    if (index == 1) {
      emptyDOB.value = false;
      dob.value = newDate;
    } else {
      dobUpdatePick.value = newDate;
    }
  }

  getListProvince() async {
    await GeneralAPI.getListProvince().then((dataFromServer) {});
  }

  Future<void> showOptionArea(BuildContext context, int flag) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          return SizedBox(
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
              SizedBox(
                height: size.height - 420,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                          onTap: () async {
                            Navigator.pop(context);
                            isLoading.value = true;
                            if (flag == 1) {
                              elementAreaTeam.value = "";
                              elementAreaDistrictTeam.value = "";
                              elementAreaWardTeam.value = "";
                              nameAreaTeam.value = "";
                              nameAreaDistrictTeam.value = "";
                              nameAreaWardTeam.value = "";
                              listWardTeam.value = [];
                              listDistrictTeam.value = [];
                              areaSearchTeam.value = "";
                              await TeamAPI.getListTeam(
                                  nameSearchTeam.value,
                                  areaSearchTeam.value,
                                  genderSearchTeam.value,
                                  sortTeamBy.value,
                                  sortTeamType.value,
                                  currentTeamPage.value);
                            } else {
                              elementAreaTour.value = "";
                              elementAreaDistrictTour.value = "";
                              elementAreaWardTour.value = "";
                              nameAreaTour.value = "";
                              nameAreaDistrictTour.value = "";
                              nameAreaWardTour.value = "";
                              listWardTour.value = [];
                              listDistrictTour.value = [];
                              areaSearchTour.value = "";
                              await TournamentAPI.getListTournament(
                                  nameSearchTour.value,
                                  userIDSearchTour.value,
                                  areaSearchTour.value,
                                  modeSearchTour.value,
                                  typeSearchTour.value,
                                  genderSearchTour.value,
                                  footballFieldSearchTour.value,
                                  sortTourBy.value,
                                  sortTourType.value,
                                  currentTournamentPage.value);
                            }
                            isLoading.value = false;
                          },
                          title: const Center(child: Text("--"))),
                      Divider(color: kGreyColor, height: 3),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listProvince.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () async {
                                  Navigator.pop(context);
                                  isLoading.value = true;
                                  if (flag == 1) {
                                    elementAreaTeam.value = "Has Value";
                                    nameAreaTeam.value =
                                        listProvince[index].name.toString();
                                    listDistrictTeam.value =
                                        listProvince[index].districts!;
                                    areaSearchTeam.value = "team-area=" +
                                        listProvince[index].name.toString() +
                                        "&";
                                    await TeamAPI.getListTeam(
                                        nameSearchTeam.value,
                                        areaSearchTeam.value,
                                        genderSearchTeam.value,
                                        sortTeamBy.value,
                                        sortTeamType.value,
                                        currentTeamPage.value);
                                  } else {
                                    elementAreaTour.value = "Has Value";
                                    nameAreaTour.value =
                                        listProvince[index].name.toString();
                                    listDistrictTour.value =
                                        listProvince[index].districts!;
                                    areaSearchTour.value = "tournament-area=" +
                                        listProvince[index].name.toString() +
                                        "&";
                                    await TournamentAPI.getListTournament(
                                        nameSearchTour.value,
                                        userIDSearchTour.value,
                                        areaSearchTour.value,
                                        modeSearchTour.value,
                                        typeSearchTour.value,
                                        genderSearchTour.value,
                                        footballFieldSearchTour.value,
                                        sortTourBy.value,
                                        sortTourType.value,
                                        currentTournamentPage.value);
                                  }
                                  isLoading.value = false;
                                },
                                title: Center(
                                  child: Text(
                                    listProvince[index].name.toString(),
                                    style: flag == 1
                                        ? TextStyle(
                                            color: listProvince[index]
                                                        .name
                                                        .toString() ==
                                                    nameAreaTeam.value
                                                ? kGreenLightColor
                                                : kBlackText)
                                        : TextStyle(
                                            color: listProvince[index]
                                                        .name
                                                        .toString() ==
                                                    nameAreaTour.value
                                                ? kGreenLightColor
                                                : kBlackText),
                                  ),
                                ),
                              ),
                              Divider(color: kGreyColor, height: 3),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }

  Future<void> showOptionAreaDistrict(BuildContext context, int flag) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          return SizedBox(
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
              SizedBox(
                height: size.height - 420,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                          onTap: () async {
                            Navigator.pop(context);
                            isLoading.value = true;
                            if (flag == 1) {
                              elementAreaDistrictTeam.value = "";
                              elementAreaWardTeam.value = "";
                              nameAreaDistrictTeam.value = "";
                              nameAreaWardTeam.value = "";
                              listWardTeam.value = [];
                              areaSearchTeam.value =
                                  "team-area=" + nameAreaTeam.value + "&";
                              await TeamAPI.getListTeam(
                                  nameSearchTeam.value,
                                  areaSearchTeam.value,
                                  genderSearchTeam.value,
                                  sortTeamBy.value,
                                  sortTeamType.value,
                                  currentTeamPage.value);
                            } else {
                              elementAreaDistrictTour.value = "";
                              elementAreaWardTour.value = "";
                              nameAreaDistrictTour.value = "";
                              nameAreaWardTour.value = "";
                              listWardTour.value = [];
                              areaSearchTour.value =
                                  "tournament-area=" + nameAreaTour.value + "&";
                              await TournamentAPI.getListTournament(
                                  nameSearchTour.value,
                                  userIDSearchTour.value,
                                  areaSearchTour.value,
                                  modeSearchTour.value,
                                  typeSearchTour.value,
                                  genderSearchTour.value,
                                  footballFieldSearchTour.value,
                                  sortTourBy.value,
                                  sortTourType.value,
                                  currentTournamentPage.value);
                            }
                            isLoading.value = false;
                          },
                          title: const Center(child: Text("--"))),
                      Divider(color: kGreyColor, height: 3),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: flag == 1
                            ? listDistrictTeam.length
                            : listDistrictTour.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () async {
                                  Navigator.pop(context);
                                  isLoading.value = true;
                                  if (flag == 1) {
                                    elementAreaDistrictTeam.value = "Has Value";
                                    nameAreaDistrictTeam.value =
                                        listDistrictTeam[index].name.toString();
                                    listWardTeam.value =
                                        listDistrictTeam[index].wards!;
                                    areaSearchTeam.value = "team-area=" +
                                        listDistrictTeam[index]
                                            .name
                                            .toString() +
                                        "&";
                                    await TeamAPI.getListTeam(
                                        nameSearchTeam.value,
                                        areaSearchTeam.value,
                                        genderSearchTeam.value,
                                        sortTeamBy.value,
                                        sortTeamType.value,
                                        currentTeamPage.value);
                                  } else {
                                    elementAreaDistrictTour.value = "Has Value";
                                    nameAreaDistrictTour.value =
                                        listDistrictTour[index].name.toString();
                                    listWardTour.value =
                                        listDistrictTour[index].wards!;
                                    areaSearchTour.value = "tournament-area=" +
                                        listDistrictTour[index]
                                            .name
                                            .toString() +
                                        "&";
                                    await TournamentAPI.getListTournament(
                                        nameSearchTour.value,
                                        userIDSearchTour.value,
                                        areaSearchTour.value,
                                        modeSearchTour.value,
                                        typeSearchTour.value,
                                        genderSearchTour.value,
                                        footballFieldSearchTour.value,
                                        sortTourBy.value,
                                        sortTourType.value,
                                        currentTournamentPage.value);
                                  }
                                  isLoading.value = false;
                                },
                                title: Center(
                                  child: Text(
                                    flag == 1
                                        ? listDistrictTeam[index]
                                            .name
                                            .toString()
                                        : listDistrictTour[index]
                                            .name
                                            .toString(),
                                    style: flag == 1
                                        ? TextStyle(
                                            color: listDistrictTeam[index]
                                                        .name
                                                        .toString() ==
                                                    nameAreaDistrictTeam.value
                                                ? kGreenLightColor
                                                : kBlackText)
                                        : TextStyle(
                                            color: listDistrictTour[index]
                                                        .name
                                                        .toString() ==
                                                    nameAreaDistrictTour.value
                                                ? kGreenLightColor
                                                : kBlackText),
                                  ),
                                ),
                              ),
                              Divider(color: kGreyColor, height: 3),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }

  Future<void> showOptionAreaWard(BuildContext context, int flag) async {
    await showModalBottomSheet(
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          return SizedBox(
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
              SizedBox(
                height: size.height - 420,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                          onTap: () async {
                            Navigator.pop(context);
                            isLoading.value = true;
                            if (flag == 1) {
                              elementAreaWardTeam.value = "";
                              nameAreaWardTeam.value = "";
                              areaSearchTeam.value = "team-area=" +
                                  nameAreaDistrictTeam.value +
                                  "&";
                              await TeamAPI.getListTeam(
                                  nameSearchTeam.value,
                                  areaSearchTeam.value,
                                  genderSearchTeam.value,
                                  sortTeamBy.value,
                                  sortTeamType.value,
                                  currentTeamPage.value);
                            } else {
                              elementAreaWardTour.value = "";
                              nameAreaWardTour.value = "";
                              areaSearchTour.value = "tournament-area=" +
                                  nameAreaDistrictTour.value +
                                  "&";
                              await TournamentAPI.getListTournament(
                                  nameSearchTour.value,
                                  userIDSearchTour.value,
                                  areaSearchTour.value,
                                  modeSearchTour.value,
                                  typeSearchTour.value,
                                  genderSearchTour.value,
                                  footballFieldSearchTour.value,
                                  sortTourBy.value,
                                  sortTourType.value,
                                  currentTournamentPage.value);
                            }
                            isLoading.value = false;
                          },
                          title: const Center(child: Text("--"))),
                      Divider(color: kGreyColor, height: 3),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: flag == 1
                            ? listWardTeam.length
                            : listWardTour.length,
                        itemBuilder: (BuildContext context, index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () async {
                                  Navigator.pop(context);
                                  isLoading.value = true;
                                  if (flag == 1) {
                                    elementAreaWardTeam.value = "Has Value";
                                    nameAreaWardTeam.value =
                                        listWardTeam[index].name.toString();
                                    areaSearchTeam.value = "team-area=" +
                                        listWardTeam[index].name.toString() +
                                        "&";
                                    await TeamAPI.getListTeam(
                                        nameSearchTeam.value,
                                        areaSearchTeam.value,
                                        genderSearchTeam.value,
                                        sortTeamBy.value,
                                        sortTeamType.value,
                                        currentTeamPage.value);
                                  } else {
                                    elementAreaWardTour.value = "Has Value";
                                    nameAreaWardTour.value =
                                        listWardTour[index].name.toString();
                                    areaSearchTour.value = "tournament-area=" +
                                        listWardTour[index].name.toString() +
                                        "&";
                                    await TournamentAPI.getListTournament(
                                        nameSearchTour.value,
                                        userIDSearchTour.value,
                                        areaSearchTour.value,
                                        modeSearchTour.value,
                                        typeSearchTour.value,
                                        genderSearchTour.value,
                                        footballFieldSearchTour.value,
                                        sortTourBy.value,
                                        sortTourType.value,
                                        currentTournamentPage.value);
                                  }
                                  isLoading.value = false;
                                },
                                title: Center(
                                  child: Text(
                                    flag == 1
                                        ? listWardTeam[index].name.toString()
                                        : listWardTour[index].name.toString(),
                                    style: flag == 1
                                        ? TextStyle(
                                            color: listWardTeam[index]
                                                        .name
                                                        .toString() ==
                                                    nameAreaWardTeam.value
                                                ? kGreenLightColor
                                                : kBlackText)
                                        : TextStyle(
                                            color: listWardTour[index]
                                                        .name
                                                        .toString() ==
                                                    nameAreaWardTour.value
                                                ? kGreenLightColor
                                                : kBlackText),
                                  ),
                                ),
                              ),
                              Divider(color: kGreyColor, height: 3),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
        });
  }
}
