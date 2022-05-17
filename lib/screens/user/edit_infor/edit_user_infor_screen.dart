import 'dart:io';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../constant.dart';

class EditUserInforScreen extends StatefulWidget {
  EditUserInforScreen({Key? key}) : super(key: key);

  @override
  State<EditUserInforScreen> createState() => _EditUserInforScreenState();
}

class _EditUserInforScreenState extends State<EditUserInforScreen> {
  final generalController = Get.put(GeneralController());

  final userController = Get.put(UserController());

  TextEditingController textNameController = TextEditingController();
  TextEditingController textAddressController = TextEditingController();
  TextEditingController textPhoneController = TextEditingController();
  TextEditingController textBioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textNameController.text = userController.user.value.username.toString();
    textAddressController.text = userController.user.value.address.toString();
    textPhoneController.text = userController.user.value.phone.toString();
    textBioController.text = userController.user.value.bio.toString();

    userController.genderUpdate.value =
        userController.user.value.gender == "Female" ? false : true;
    userController.dobUpdate.value = DateFormat("yyyy-MM-dd").format(
        DateTime.parse(userController.user.value.dateOfBirth.toString()));
    userController.emptyNameUpdate.value = false;
    userController.emptyPhoneUpdate.value = false;
    userController.imageUpdate.value = File('');
    userController.dobUpdatePick.value = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            title: Text(
              "Thông tin tài khoản",
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
                    Center(
                      child: GestureDetector(
                        onTap: () =>
                            generalController.showOptionImage(context, 2),
                        child: Stack(
                          children: [
                            SizedBox(
                                width: 180,
                                height: 180,
                                child: userController
                                      .imageUpdate.value.path.isEmpty
                                  ? ClipOval(
                                  child: Image(
                                      image: NetworkImage(userController
                                          .user.value.avatar
                                          .toString())),
                                )
                                  : ClipOval(
                                      child: Image.file(
                                          userController.imageUpdate.value,
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
                      controller: TextEditingController(
                          text: userController.user.value.email),
                      readOnly: true,
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
                      ),
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
                        errorText: userController.emptyNameUpdate.value
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
                              userController.genderUpdate.value = true;
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
                                        userController.genderUpdate.value,
                                    onChanged: (newValue) {
                                      userController.genderUpdate.value = true;
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
                              userController.genderUpdate.value = false;
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
                                        userController.genderUpdate.value,
                                    onChanged: (newValue) {
                                      userController.genderUpdate.value = false;
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
                        generalController.pickDate(context, 2);
                      },
                      readOnly: true,
                      controller: TextEditingController(
                          text: userController.dobUpdatePick.value.year >= DateTime.now().year ? userController.dobUpdate.value : DateFormat("yyyy-MM-dd").format(userController.dobUpdatePick.value)),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kGreenLightColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.calendar_today_rounded,
                              color: kGreyColor,
                            )),
                      ),
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
                        errorText: userController.emptyPhoneUpdate.value
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
                        labelText: "Giới thiệu bản thân",
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
                          String result = await userController.updateUser(
                              textNameController.text,
                              textAddressController.text,
                              textPhoneController.text,
                              textBioController.text);
                          if (result == "") {
                            Fluttertoast.showToast(
                                msg: "Không thể kết nối tới máy chủ",
                                fontSize: 18);
                          } else {
                            Fluttertoast.showToast(msg: result, fontSize: 18);
                            if (result == "Cập nhật thành công") {
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
