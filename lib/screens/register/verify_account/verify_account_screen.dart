import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/botom_navbar/bottom_navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class VerifyAccountScreen extends StatelessWidget {
  VerifyAccountScreen({Key? key, required this.emailRegister})
      : super(key: key);

  final String emailRegister;

  final userController = Get.put(UserController());
  final generalController = Get.put(GeneralController());
  final teamController = Get.put(TeamController());
  final tournamentController = Get.put(TournamentController());

  TextEditingController textCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            title: Text(
              "Xác thực tài khoản",
              style: TextStyle(color: kBlackText),
            ),
            centerTitle: true,
            backgroundColor: kBackgroundColor,
            elevation: 1,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: kBlackText,
              ),
              onPressed: () {
                userController.obsPassRegister.value = true;
                userController.obsConfirmPassRegister.value = true;
                Get.back();
              },
            ),
          ),
          body: Obx(
            () => Container(
              padding: EdgeInsets.all(kPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hệ thống đã gửi mã xác thực vào email đã đăng ký. Vui lòng nhập mã vào ô bên dưới để xác thực tài khoản.",
                    style: TextStyle(
                      color: kBlackText,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  TextField(
                    controller: textCodeController,
                    decoration: InputDecoration(
                      labelText: "Mã xác thực",
                      labelStyle: TextStyle(color: kGreyColor),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kGreenLightColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      errorText: userController.emptyCode.value
                          ? "Vui lòng nhập mã xác thực email"
                          : null,
                      errorStyle: const TextStyle(fontSize: 14),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        generalController.isLoading.value = true;
                        String result = await userController.registerUser(
                            emailRegister, textCodeController.text);
                        if (result == "") {
                          teamController.getListTeam();
                          tournamentController.getListTournament();
                          generalController.getListProvince();
                          generalController.currentIndex.value = 0;
                          Fluttertoast.showToast(
                              msg: "Đăng ký thành công", fontSize: 18);
                          Get.to(const BottomNavbarScreen());
                        } else {
                          Fluttertoast.showToast(
                              msg: "Mã xác thực không hợp lệ", fontSize: 18);
                        }
                        generalController.isLoading.value = false;
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              kGreenLightColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ))),
                      child: Text(
                        "XÁC THỰC",
                        style: TextStyle(
                          color: kWhiteText,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: kPadding,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Text(
                        "Bạn chưa nhận được mã? ",
                        style: TextStyle(
                          color: kGreyColor,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                          onTap: () async {
                            generalController.isLoading.value = true;
                            String result = await userController
                                .verifyEmail(emailRegister, "", "", "", "", "", "", 2);
                            if (result != "") {
                              Fluttertoast.showToast(msg: result, fontSize: 18);
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Đã gửi lại mã xác nhận", fontSize: 18);
                            }
                            generalController.isLoading.value = false;
                          },
                          child: Text(
                            "Gửi lại",
                            style: TextStyle(
                              color: kGreenLightColor,
                              fontSize: 18,
                            ),
                          )),
                      Expanded(child: Container()),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
