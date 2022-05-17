import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/auth_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/user/edit_infor/change_password_screen.dart';
import 'package:amateur_football_league_mobile/screens/user/edit_infor/edit_user_infor_screen.dart';
import 'package:amateur_football_league_mobile/screens/user/infor/components/my_text_field.dart';
import 'package:amateur_football_league_mobile/services/google_sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final userController = Get.put(UserController());
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: kBlueBlack,
            child: Row(
              children: [
                ClipOval(
                  child: Image(
                    image: NetworkImage(userController.user.value.avatar ==
                                "" ||
                            userController.user.value.avatar == null
                        ? "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"
                        : userController.user.value.avatar.toString()),
                    width: 70,
                    height: 70,
                  ),
                ),
                SizedBox(
                  width: kPadding / 2,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userController.user.value.username.toString(),
                        style: TextStyle(
                          color: kWhiteText,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userController.user.value.email.toString(),
                        style: TextStyle(
                          color: kWhiteText,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: kPadding, horizontal: kPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "THÔNG TIN TÀI KHOẢN",
                        style: TextStyle(
                          color: kBlackText,
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => EditUserInforScreen(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 600));
                        },
                        child: Icon(
                          Icons.edit,
                          color: kGreenLightColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kPadding / 4,
                  ),
                  MyTextField(
                      hintext: userController.user.value.dateOfBirth
                              .toString()
                              .isEmpty
                          ? "Chưa cập nhật ngày sinh"
                          : DateFormat("yyyy-MM-dd").format(DateTime.parse(userController.user.value.dateOfBirth.toString())),
                      icon: Icons.calendar_month),
                  MyTextField(
                      hintext:
                          userController.user.value.phone.toString().isEmpty
                              ? "Chưa cập nhật số điện thoại"
                              : userController.user.value.phone,
                      icon: Icons.phone),
                  MyTextField(
                      hintext: userController.user.value.gender
                              .toString()
                              .isEmpty
                          ? "Chưa cập nhật giới tính"
                          : userController.user.value.gender.toString() ==
                                  "Male"
                              ? "Nam"
                              : userController.user.value.gender.toString() ==
                                      "Female"
                                  ? "Nữ"
                                  : "Chưa cập nhật giới tính",
                      icon: Icons.supervisor_account),
                  MyTextField(
                      hintext:
                          userController.user.value.address.toString().isEmpty
                              ? "Chưa cập nhật địa chỉ"
                              : userController.user.value.address,
                      icon: Icons.location_on),
                  MyTextField(
                      hintext: userController.user.value.bio.toString().isEmpty
                          ? "Chưa cập nhật phần giới thiệu"
                          : userController.user.value.bio,
                      icon: Icons.description),
                  SizedBox(
                    height: kPadding,
                  ),
                  Text(
                        "THÔNG TIN CÁ NHÂN",
                        style: TextStyle(
                          color: kBlackText,
                          fontSize: 18,
                        ),
                      ),
                  SizedBox(
                    height: kPadding / 4,
                  ),
                  MyTextField(
                      hintext: userController.user.value.roleId == 1
                          ? "Admin"
                          : userController.user.value.roleId == 2
                              ? "Chủ giải đấu"
                              : userController.user.value.roleId == 3
                                  ? "Chủ đội bóng"
                                  : "Member",
                      icon: Icons.reorder_outlined),
                  MyTextField(
                      hintext: userController.user.value.identityCard
                              .toString()
                              .isEmpty
                          ? "Chưa cập nhật số cmnd"
                          : userController.user.value.identityCard,
                      icon: Icons.rule_folder),
                  MyTextField(
                      hintext: userController.user.value.phoneBusiness
                              .toString()
                              .isEmpty
                          ? "Chưa cập nhật số điện thoại doanh nghiệp"
                          : userController.user.value.phoneBusiness,
                      icon: Icons.phone),
                  MyTextField(
                      hintext: userController.user.value.nameBusiness
                              .toString()
                              .isEmpty
                          ? "Chưa cập nhật số tên doanh nghiệp"
                          : userController.user.value.nameBusiness,
                      icon: Icons.account_box),
                  SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    "CHUNG",
                    style: TextStyle(
                      color: kBlackText,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: kPadding / 4,
                  ),
                  MyTextField(
                    hintext: "Cài đặt",
                    icon: Icons.settings,
                    onTap: () {},
                  ),
                  MyTextField(
                    hintext: "Đổi mật khẩu",
                    icon: Icons.key,
                    onTap: () {
                      Get.to(() => ChangePasswordScreen(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 600));
                    },
                  ),
                  MyTextField(
                    hintext: "Nâng cấp tài khoản",
                    icon: Icons.upgrade,
                    onTap: () {},
                  ),
                  MyTextField(
                    hintext: "Đăng xuất",
                    icon: Icons.logout,
                    onTap: () {
                      var provider = Provider.of<GoogleSignInProvider>(context,
                          listen: false);
                      provider.logout();
                      authController.logout();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
