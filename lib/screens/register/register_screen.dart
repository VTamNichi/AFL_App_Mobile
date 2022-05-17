import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/auth_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/botom_navbar/bottom_navbar_screen.dart';
import 'package:amateur_football_league_mobile/screens/register/verify_account/verify_account_screen.dart';
import 'package:amateur_football_league_mobile/services/google_sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final authController = Get.put(AuthController());
  final generalController = Get.put(GeneralController());
  final userController = Get.put(UserController());
  final teamController = Get.put(TeamController());
  final tournamentController = Get.put(TournamentController());

  TextEditingController textEmailController = TextEditingController();
  TextEditingController textPasswordController = TextEditingController();
  TextEditingController textConfirmPasswordController = TextEditingController();
  TextEditingController textNameController = TextEditingController();

  TextEditingController textAddressController = TextEditingController();
  TextEditingController textPhoneController = TextEditingController();

  TextEditingController textBioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            title: Text(
              "Đăng ký",
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
                authController.obsPassLogin.value = true;
                Get.back();
              },
            ),
          ),
          body: Obx(
            () => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(kPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () =>
                            generalController.showOptionImage(context, 1),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 180,
                              height: 180,
                              child: userController
                                      .imageRegister.value.path.isEmpty
                                  ? const ClipOval(
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/default_avatar.png')),
                                    )
                                  : ClipOval(
                                      child: Image.file(
                                          userController.imageRegister.value,
                                          width: 180,
                                          height: 180,
                                          fit: BoxFit.cover),
                                    ),
                            ),
                            Positioned(
                              top: 150,
                              left: 150,
                              child: ClipOval(
                                child: Icon(
                                  Icons.camera_alt,
                                  color: kGreenLightColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kPadding,
                    ),
                    TextField(
                      controller: textEmailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(color: kGreyColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        errorText: userController.emptyEmail.value
                            ? "Vui lòng nhập email của bạn"
                            : null,
                        errorStyle: const TextStyle(fontSize: 14),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: kPadding,
                    ),
                    TextField(
                      controller: textPasswordController,
                      obscureText: userController.obsPassRegister.value,
                      decoration: InputDecoration(
                        labelText: "Mật khẩu",
                        labelStyle: TextStyle(color: kGreyColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        errorText: userController.emptyPass.value
                            ? "Vui lòng nhập mật khẩu của bạn"
                            : null,
                        errorStyle: const TextStyle(fontSize: 14),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                              onTap: () {
                                userController.obsPassRegister.value =
                                    !userController.obsPassRegister.value;
                              },
                              child: userController.obsPassRegister.value
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: kGreyColor,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: kGreyColor,
                                    )),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: kPadding,
                    ),
                    TextField(
                      controller: textConfirmPasswordController,
                      obscureText: userController.obsConfirmPassRegister.value,
                      decoration: InputDecoration(
                        labelText: "Nhập lại mật khẩu",
                        labelStyle: TextStyle(color: kGreyColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        errorText: userController.checkConfirmPass.value
                            ? "Mật khẩu xác nhận phải trùng với mật khẩu"
                            : null,
                        errorStyle: const TextStyle(fontSize: 14),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                              onTap: () {
                                userController.obsConfirmPassRegister.value =
                                    !userController
                                        .obsConfirmPassRegister.value;
                              },
                              child: userController.obsConfirmPassRegister.value
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: kGreyColor,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: kGreyColor,
                                    )),
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: kPadding,
                    ),
                    TextField(
                      controller: textNameController,
                      decoration: InputDecoration(
                        labelText: "Tên",
                        labelStyle: TextStyle(color: kGreyColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        errorText: userController.emptyName.value
                            ? "Vui lòng nhập tên của bạn"
                            : null,
                        errorStyle: const TextStyle(fontSize: 14),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: kPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              userController.selectedGender.value = true;
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Radio(
                                    value: true,
                                    activeColor: kGreenLightColor,
                                    groupValue:
                                        userController.selectedGender.value,
                                    onChanged: (newValue) {
                                      userController.selectedGender.value =
                                          true;
                                    },
                                  ),
                                  const Text(
                                    "Nam",
                                    style: TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              userController.selectedGender.value = false;
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Radio(
                                    value: false,
                                    activeColor: kGreenLightColor,
                                    groupValue:
                                        userController.selectedGender.value,
                                    onChanged: (newValue) {
                                      userController.selectedGender.value =
                                          false;
                                    },
                                  ),
                                  const Text(
                                    "Nữ",
                                    style: TextStyle(
                                      fontSize: 19,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kPadding),
                    TextField(
                      onTap: () {
                        generalController.pickDate(context, 1);
                      },
                      readOnly: true,
                      controller: TextEditingController(
                        text:
                            userController.dob.value.year >= DateTime.now().year
                                ? "Ngày sinh"
                                : DateFormat('yyyy-MM-dd')
                                    .format(userController.dob.value),
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        errorText: userController.emptyDOB.value
                            ? "Vui lòng chọn ngày sinh của bạn"
                            : null,
                        errorStyle: const TextStyle(fontSize: 14),
                        suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.calendar_today_rounded,
                              color: kGreyColor,
                            )),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: kPadding),
                    TextField(
                      controller: textAddressController,
                      decoration: InputDecoration(
                        labelText: "Địa chỉ",
                        labelStyle: TextStyle(color: kGreyColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ),
                      keyboardType: TextInputType.streetAddress,
                    ),
                    SizedBox(height: kPadding),
                    TextField(
                      controller: textPhoneController,
                      decoration: InputDecoration(
                        labelText: "Số điện thoại",
                        labelStyle: TextStyle(color: kGreyColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        errorText: userController.emptyPhone.value
                            ? "Vui lòng nhập số điện thoại"
                            : null,
                        errorStyle: const TextStyle(fontSize: 14),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: kPadding),
                    TextFormField(
                      controller: textBioController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: "Giới thiệu bản thân ",
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
                    SizedBox(
                      height: kPadding,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          String result = await userController.verifyEmail(
                              textEmailController.text,
                              textPasswordController.text,
                              textConfirmPasswordController.text,
                              textNameController.text,
                              textAddressController.text,
                              textPhoneController.text,
                              textBioController.text);
                          if (result == "") {
                            Fluttertoast.showToast(msg: result, fontSize: 18);
                          } else {
                            Get.to(() => VerifyAccountScreen(),
                                transition: Transition.zoom,
                                duration: const Duration(milliseconds: 600));
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                kGreenLightColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                            ))),
                        child: Text(
                          "ĐĂNG KÝ",
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
                            var provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            String result =
                                await provider.googleLogin("Register");
                            if (result == "") {
                              Fluttertoast.showToast(
                                  msg: "Không thể kết nối tới máy chủ",
                                  fontSize: 18);
                            } else if (result == "Đăng ký thành công") {
                              teamController.getListTeam();
                              tournamentController.getListTournament();
                              Fluttertoast.showToast(
                                  msg: "Đăng ký thành công", fontSize: 18);
                              Get.to(const BottomNavbarScreen());
                            } else {
                              Fluttertoast.showToast(msg: result, fontSize: 18);
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(kWhiteText),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24)),
                              ))),
                          icon:
                              FaIcon(FontAwesomeIcons.google, color: kRedColor),
                          label: Text(
                            "ĐĂNG KÝ VỚI GOOGLE",
                            style: TextStyle(
                              color: kBlackText,
                              fontSize: 20,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
