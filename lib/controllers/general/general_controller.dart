import 'dart:io';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class GeneralController extends GetxController {
  final userController = Get.put(UserController());
  RxInt currentIndex = 0.obs;

  void showOptionImage(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
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
        userController.imageRegister.value = imageTemp;
      } else {
        userController.imageUpdate.value = imageTemp;
      }
    } on PlatformException catch (e) {
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
      userController.emptyDOB.value = false;
      userController.dob.value = newDate;
    } else {
      userController.dobUpdatePick.value = newDate;
    }
  }
}
