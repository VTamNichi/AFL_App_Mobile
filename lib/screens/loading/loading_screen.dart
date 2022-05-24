import 'package:amateur_football_league_mobile/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: Center(
        child: SpinKitRotatingCircle(
          color: kGreenLightColor,
          size: 50.0,
        ),
      ),
    );
  }
}
