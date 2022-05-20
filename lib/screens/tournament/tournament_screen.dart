import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/screens/loading/loading_screen.dart';
import 'package:amateur_football_league_mobile/screens/tournament/components/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TournamentScreen extends StatelessWidget {
  TournamentScreen({Key? key}) : super(key: key);
  
  final generalController = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                  title: Text("Giải đấu", style: TextStyle(color: kBlackText,),),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: kBackgroundColor,
                  leading: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: kBlackText,
                    ),
                    onPressed: () {
                    },
                  ),
                  actions: [
                    SizedBox(
                      width: 60,
                      child: Stack(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              size: 34,
                              color: kBlackText,
                            ),
                            onPressed: () {
                            },
                          ), ],
                      ),
                    )
                  ],
                ),
              backgroundColor: kGreyBackground,
              body: SingleChildScrollView(child: Body()),
            ),
            generalController.isLoading.value
                ? const LoadingScreen()
                : Container(),
          ],
        ),
      )
    );
  }
}