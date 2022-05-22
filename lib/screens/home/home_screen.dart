import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Trang chủ"),
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
                      onPressed: () {
                        //Get.to(MyHomePage());
                      },
                    ), ],
                ),
              )
            ],
          ),
        body: SingleChildScrollView(child: Body()),
        backgroundColor: kBlueBlack,
      )
    );
  }
}