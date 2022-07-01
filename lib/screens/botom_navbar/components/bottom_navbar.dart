import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/screens/football_player/football_player_screen.dart';
import 'package:amateur_football_league_mobile/screens/home/home_screen.dart';
import 'package:amateur_football_league_mobile/screens/tournament/tournament_screen.dart';
import 'package:amateur_football_league_mobile/screens/team/team_screen.dart';
import 'package:amateur_football_league_mobile/screens/user/infor/user_infor_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({Key? key}) : super(key: key);
  final generalController = Get.put(GeneralController());

  final screens = [
    const HomeScreen(),
    TournamentScreen(),
    TeamScreen(),
    FootballPlayerScreen(),
    UserInforScreen(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Obx(() => SafeArea(
            child: screens[generalController.currentIndex.value])),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: kBackgroundColor,
            selectedItemColor: kGreenLightColor,
            showUnselectedLabels: false,
            iconSize: 30,
            selectedFontSize: 14,
            currentIndex: generalController.currentIndex.value,
            onTap: (index) => {
              generalController.currentIndex.value = index,
            },
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Trang chủ",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.emoji_events),
                label: "Giải đấu",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer),
                label: "Đội bóng",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.sports_handball),
                label: "Cầu thủ",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Trang cá nhân",
              ),
            ],
          ),
        ),
      );
}
