import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/screens/tournament/components/body.dart';
import 'package:flutter/material.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
      )
    );
  }
}