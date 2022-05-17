import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);

  final userController = Get.put(UserController());

  TextEditingController textCurrentPasswordController = TextEditingController();
  TextEditingController textNewPasswordController = TextEditingController();
  TextEditingController textConfirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            title: Text(
              "Đổi mật khẩu",
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
                    TextField(
                      controller: textCurrentPasswordController,
                      obscureText: userController.obsCurrentPass.value,
                      decoration: InputDecoration(
                        labelText: "Mật khẩu hiện tại",
                        labelStyle: TextStyle(color: kGreyColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        errorText: userController.emptyCurrentPass.value
                            ? "Vui lòng nhập mật khẩu của bạn"
                            : null,
                        errorStyle: const TextStyle(fontSize: 14),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                              onTap: () {
                                userController.obsCurrentPass.value =
                                    !userController.obsCurrentPass.value;
                              },
                              child: userController.obsCurrentPass.value
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
                      controller: textNewPasswordController,
                      obscureText: userController.obsNewPass.value,
                      decoration: InputDecoration(
                        labelText: "Mật khẩu mới",
                        labelStyle: TextStyle(color: kGreyColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        errorText: userController.emptyNewPass.value
                            ? "Vui lòng nhập mật khẩu mới của bạn"
                            : null,
                        errorStyle: const TextStyle(fontSize: 14),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                              onTap: () {
                                userController.obsNewPass.value =
                                    !userController.obsNewPass.value;
                              },
                              child: userController.obsNewPass.value
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
                      controller: textConfirmNewPasswordController,
                      obscureText: userController.obsConfirmNewPass.value,
                      decoration: InputDecoration(
                        labelText: "Nhập lại mật khẩu mới",
                        labelStyle: TextStyle(color: kGreyColor),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        errorText: userController.checkConfirmNewPass.value
                            ? "Mật khẩu xác nhận phải trùng với mật khẩu mới"
                            : null,
                        errorStyle: const TextStyle(fontSize: 14),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                              onTap: () {
                                userController.obsConfirmNewPass.value =
                                    !userController
                                        .obsConfirmNewPass.value;
                              },
                              child: userController.obsConfirmNewPass.value
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
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          String result = await userController.changePassword(
                              textCurrentPasswordController.text,
                              textNewPasswordController.text,
                              textConfirmNewPasswordController.text);
                          if (result == "") {
                            Fluttertoast.showToast(msg: "Không thể kết nối máy chủ", fontSize: 18);
                          } else {
                            Fluttertoast.showToast(msg: result, fontSize: 18);
                            if (result == "Đổi mật khẩu thành công") {
                              Get.back();
                            }
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
                          "LƯU THAY ĐỔI",
                          style: TextStyle(
                            color: kWhiteText,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
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
