import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/auth_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/botom_navbar/bottom_navbar_screen.dart';
import 'package:amateur_football_league_mobile/screens/register/register_screen.dart';
import 'package:amateur_football_league_mobile/screens/user/edit_infor/reset_password_screen.dart';
import 'package:amateur_football_league_mobile/services/google_sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final authController = Get.put(AuthController());
  final generalController = Get.put(GeneralController());
  final userController = Get.put(UserController());
  final teamController = Get.put(TeamController());
  final tournamentController = Get.put(TournamentController());

  @override
  Widget build(BuildContext context) {
    email = TextEditingController(text: generalController.emailLogin.value);
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Container(
        padding: EdgeInsets.all(kPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(
              fit: BoxFit.cover,
              image: const AssetImage('assets/images/logo_afl.png'),
              width: size.width,
            ),
            SizedBox(
              height: kPadding,
            ),
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "ĐĂNG NHẬP",
                  style: TextStyle(
                      color: kBlackText,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                )),
            SizedBox(
              height: kPadding,
            ),
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: kGreyColor),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kGreenLightColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                errorText: authController.emptyEmailLogin.value
                    ? "Vui lòng nhập email của bạn"
                    : null,
                errorStyle: const TextStyle(fontSize: 14),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: kPadding),
            TextField(
              controller: password,
              obscureText: authController.obsPassLogin.value,
              decoration: InputDecoration(
                labelText: "Mật khẩu",
                labelStyle: TextStyle(color: kGreyColor),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kGreenLightColor),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () {
                        authController.obsPassLogin.value =
                            !authController.obsPassLogin.value;
                      },
                      child: authController.obsPassLogin.value
                          ? Icon(
                              Icons.visibility_off,
                              color: kGreyColor,
                            )
                          : Icon(
                              Icons.visibility,
                              color: kGreyColor,
                            )),
                ),
                errorText: authController.emptyPassLogin.value
                    ? "Vui lòng nhập mật khẩu của bạn"
                    : null,
                errorStyle: const TextStyle(fontSize: 15),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: kPadding / 2,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    userController.textButton.value = "GỬI MÃ XÁC THỰC";
                    userController.hasCode.value = false;
                    userController.checkCodeReset.value = false;
                    userController.emailResetRead.value = false;
                    userController.codeResetRead.value = false;
                    userController.obsNewPassReset.value = true;
                    userController.obsConfirmNewPassReset.value = true;
                    
                    Get.to(() => ResetPasswordScreen(),
                          transition: Transition.zoom,
                          duration: const Duration(milliseconds: 600));
                  },
                  child: Text(
                    "Quên mật khẩu",
                    style: TextStyle(
                        color: kGreenLightColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: kPadding,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    generalController.emailLogin.value = email.text;
                    generalController.isLoading.value = true;
                    String result = await authController.checkLogin(
                        email.text, password.text);
                    if (result == "") {
                      Fluttertoast.showToast(
                          msg: "Không thể kết nối tới máy chủ", fontSize: 18);
                    } else {
                      Fluttertoast.showToast(msg: result, fontSize: 18);
                      if (result == "Đăng nhập thành công") {
                        generalController.getListProvince();
                        Get.to(const BottomNavbarScreen());
                      }
                    }
                    generalController.isLoading.value = false;
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kGreenLightColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ))),
                  child: Text(
                    "ĐĂNG NHẬP",
                    style: TextStyle(color: kWhiteText, fontSize: 20),
                  )),
            ),
            SizedBox(
              height: kPadding,
            ),
            Center(
              child: Text(
                "Hoặc",
                style: TextStyle(color: kGreyColor, fontSize: 18),
              ),
            ),
            SizedBox(
              height: kPadding,
            ),
            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    var provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    String result = await provider.googleLogin("Login");
                    if (result == "") {
                      Fluttertoast.showToast(
                          msg: "Không thể kết nối tới máy chủ", fontSize: 18);
                    } else {
                      Fluttertoast.showToast(msg: result, fontSize: 18);
                      if (result == "Đăng nhập thành công") {
                        teamController.getListTeam();
                        tournamentController.getListTournament();
                        generalController.getListProvince();
                        generalController.currentIndex.value = 0;
                        Get.to(const BottomNavbarScreen());
                      }
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kWhiteText),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ))),
                  icon: FaIcon(FontAwesomeIcons.google, color: kRedColor),
                  label: Text(
                    "ĐĂNG NHẬP VỚI GOOGLE",
                    style: TextStyle(
                      color: kBlackText,
                      fontSize: 20,
                    ),
                  ),
                )),
            SizedBox(
              height: kPadding * 2,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Text(
                  "Bạn chưa có tài khoản? ",
                  style: TextStyle(
                    color: kGreyColor,
                    fontSize: 15,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      userController.obsPassRegister.value = true;
                      userController.obsConfirmPassRegister.value = true;
                      generalController.dob.value = DateTime.now();
                      Get.to(() => RegisterScreen(),
                          transition: Transition.zoom,
                          duration: const Duration(milliseconds: 600));
                    },
                    child: Text(
                      "Đăng ký",
                      style: TextStyle(
                        color: kGreenLightColor,
                        fontSize: 18,
                      ),
                    )),
                Expanded(child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
