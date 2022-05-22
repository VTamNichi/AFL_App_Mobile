import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/auth_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  final authController = Get.put(AuthController());
  final userController = Get.put(UserController());
  final generalController = Get.put(GeneralController());

  TextEditingController textEmailResetController = TextEditingController();
  TextEditingController textCodeResetController = TextEditingController();
  TextEditingController textNewPasswordResetController =
      TextEditingController();
  TextEditingController textConfirmNewPasswordResetController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => Stack(
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                backgroundColor: kBackgroundColor,
                appBar: AppBar(
                  title: Text(
                    "Quên mật khẩu",
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
                body: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(kPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vui lòng nhập email để lấy mã xác thực",
                            style: TextStyle(
                              color: kBlackText,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            height: kPadding,
                          ),
                          TextField(
                            controller: textEmailResetController,
                            readOnly: userController.emailResetRead.value,
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
                              errorText: userController.emptyEmailReset.value
                                  ? "Vui lòng nhập email của bạn"
                                  : null,
                              errorStyle: const TextStyle(fontSize: 14),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: kPadding,
                          ),
                          userController.hasCode.value
                              ? Text(
                                  "Nhập mã xác thực để thay đổi mật khẩu",
                                  style: TextStyle(
                                    color: kBlackText,
                                    fontSize: 22,
                                  ),
                                )
                              : Container(),
                          userController.hasCode.value
                              ? SizedBox(
                                  height: kPadding,
                                )
                              : Container(),
                          userController.hasCode.value
                              ? TextField(
                                  controller: textCodeResetController,
                                  readOnly: userController.codeResetRead.value,
                                  decoration: InputDecoration(
                                    labelText: "Mã xác thực",
                                    labelStyle: TextStyle(color: kGreyColor),
                                    border: const OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kGreenLightColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    errorText: userController.emptyCodeReset.value
                                        ? "Vui lòng nhập mã xác thực email"
                                        : null,
                                    errorStyle: const TextStyle(fontSize: 14),
                                  ),
                                  keyboardType: TextInputType.number,
                                )
                              : Container(),
                          userController.hasCode.value
                              ? SizedBox(
                                  height: kPadding,
                                )
                              : Container(),
                          userController.checkCodeReset.value
                              ? Text(
                                  "Nhập mật khẩu mới",
                                  style: TextStyle(
                                    color: kBlackText,
                                    fontSize: 22,
                                  ),
                                )
                              : Container(),
                          userController.checkCodeReset.value
                              ? SizedBox(
                                  height: kPadding,
                                )
                              : Container(),
                          userController.checkCodeReset.value
                              ? TextField(
                                  controller: textNewPasswordResetController,
                                  obscureText: userController.obsNewPassReset.value,
                                  decoration: InputDecoration(
                                    labelText: "Mật khẩu mới",
                                    labelStyle: TextStyle(color: kGreyColor),
                                    border: const OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kGreenLightColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    errorText: userController.emptyNewPassReset.value
                                        ? "Vui lòng nhập mật khẩu mới của bạn"
                                        : null,
                                    errorStyle: const TextStyle(fontSize: 14),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                          onTap: () {
                                            userController.obsNewPassReset.value =
                                                !userController.obsNewPassReset.value;
                                          },
                                          child: userController.obsNewPassReset.value
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
                                )
                              : Container(),
                          userController.checkCodeReset.value
                              ? SizedBox(
                                  height: kPadding,
                                )
                              : Container(),
                          userController.checkCodeReset.value
                              ? TextField(
                                  controller: textConfirmNewPasswordResetController,
                                  obscureText:
                                      userController.obsConfirmNewPassReset.value,
                                  decoration: InputDecoration(
                                    labelText: "Nhập lại mật khẩu mới",
                                    labelStyle: TextStyle(color: kGreyColor),
                                    border: const OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kGreenLightColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    errorText: userController
                                            .checkConfirmNewPassReset.value
                                        ? "Mật khẩu xác nhận phải trùng với mật khẩu mới"
                                        : null,
                                    errorStyle: const TextStyle(fontSize: 14),
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: GestureDetector(
                                          onTap: () {
                                            userController
                                                    .obsConfirmNewPassReset.value =
                                                !userController
                                                    .obsConfirmNewPassReset.value;
                                          },
                                          child: userController
                                                  .obsConfirmNewPassReset.value
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
                                )
                              : Container(),
                          userController.checkCodeReset.value
                              ? SizedBox(
                                  height: kPadding,
                                )
                              : Container(),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                generalController.isLoading.value = true;
                                if (userController.hasCode.isFalse) {
                                  String result = await userController
                                      .getVerifyCode(textEmailResetController.text);
                                  if (result != "") {
                                    Fluttertoast.showToast(msg: result, fontSize: 18);
                                  } else {
                                    userController.textButton.value = "XÁC THỰC";
                                    userController.hasCode.value = true;
                                    userController.emailResetRead.value = true;
                                  }
                                } else if (userController.checkCodeReset.isFalse) {
                                  String result =
                                      await userController.checkVerifyCodeReset(
                                          textEmailResetController.text,
                                          textCodeResetController.text);
                                  if (result == "") {
                                    userController.codeResetRead.value = true;
                                    userController.textButton.value = "ĐỔI MẬT KHẨU";
                                  } else {
                                    Fluttertoast.showToast(msg: result, fontSize: 18);
                                  }
                                } else {
                                  String result = await userController.resetPassword(
                                      textEmailResetController.text,
                                      textNewPasswordResetController.text,
                                      textConfirmNewPasswordResetController.text);
                                  if (result == "") {
                                    Fluttertoast.showToast(
                                        msg: "Không thể kết nối máy chủ",
                                        fontSize: 18);
                                  } else {
                                    authController.obsPassLogin.value = true;
                                    Fluttertoast.showToast(
                                        msg: "Đổi mật khẩu thành công", fontSize: 18);
                                    Get.back();
                                  }
                                }
                                generalController.isLoading.value = false;
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
                                userController.textButton.value,
                                style: TextStyle(
                                  color: kWhiteText,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          userController.checkCodeReset.isFalse &&
                                  userController.hasCode.value
                              ? SizedBox(
                                  height: kPadding,
                                )
                              : Container(),
                          userController.checkCodeReset.isFalse &&
                                  userController.hasCode.value
                              ? Row(
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
                                          String result =
                                              await userController.getVerifyCode(
                                                  textEmailResetController.text);
                                          if (result != "") {
                                            Fluttertoast.showToast(
                                                msg: result, fontSize: 18);
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "Đã gửi lại mã xác nhận",
                                                fontSize: 18);
                                          }
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
                              : Container(),
                        ],
                      ),
                    ),
                ),
              ),
            ),
            generalController.isLoading.value
                  ? const LoadingScreen()
                  : Container(),
          ],
        ),
      ),
    );
  }
}
