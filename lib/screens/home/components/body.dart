import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/user_controller.dart';
import 'package:amateur_football_league_mobile/screens/botom_navbar/bottom_navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final userController = Get.put(UserController());
  final generalController = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(kPadding),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            "Siêu ứng dụng dành cho\ncộng đồng yêu thể thao",
            style: TextStyle(
                color: kWhiteText, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: kPadding,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                ),
                child: Image.asset(
                  "assets/images/league.png",
                  width: size.width,
                ),
              ),
              Column(
                children: [
                  Text(
                    "Giải đấu",
                    style: TextStyle(
                        color: kWhiteText,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Bất kỳ ai cũng có thể tạo giải đấu",
                    style: TextStyle(
                      color: kWhiteText,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: kPadding / 3,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            width: size.width,
            child: ElevatedButton(
                  onPressed: () async {
                    generalController.currentIndex.value = 1;
                    Get.to(() => const BottomNavbarScreen(),
                          transition: Transition.leftToRight,
                          duration: const Duration(milliseconds: 600));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kGreenLightColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ))),
                  child: Text(
                    "TÌM GIẢI ĐẤU",
                    style: TextStyle(color: kWhiteText, fontSize: 20),
                  ),
                ),
          ),
          SizedBox(height: kPadding,),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                ),
                child: Image.asset(
                  "assets/images/team.png",
                  width: size.width,
                ),
              ),
              Column(
                children: [
                  Text(
                    "Đội bóng",
                    style: TextStyle(
                        color: kWhiteText,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Quản lý đội bóng vô cùng dễ dàng",
                    style: TextStyle(
                      color: kWhiteText,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: kPadding / 3,
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            width: size.width,
            child: ElevatedButton(
                  onPressed: () async {
                    generalController.currentIndex.value = 2;
                    Get.to(() => const BottomNavbarScreen(),
                          transition: Transition.leftToRight,
                          duration: const Duration(milliseconds: 600));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kGreenLightColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ))),
                  child: Text(
                    "TÌM ĐỘI BÓNG",
                    style: TextStyle(color: kWhiteText, fontSize: 20),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
