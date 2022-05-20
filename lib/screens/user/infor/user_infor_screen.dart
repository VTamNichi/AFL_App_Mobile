import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/user/infor/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInforScreen extends StatelessWidget {
  UserInforScreen({Key? key}) : super(key: key);
  final userController = Get.put(UserController());
  final generalController = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text("Tài khoản"),
                centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: kBlueBlack,
                actions: [
                  SizedBox(
                    width: 60,
                    child: Stack(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.notifications,
                            size: 34,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
              backgroundColor: kBlueBlack,
              body: SingleChildScrollView(child: Body()),
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
