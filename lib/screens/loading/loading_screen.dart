import 'package:amateur_football_league_mobile/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key, this.isWhite}) : super(key: key);

  final isWhite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isWhite == "a" ? Colors.white : Colors.white54,
      body: Center(
        child: SpinKitRotatingCircle(
          color: kGreenLightColor,
          size: 50.0,
        ),
      ),
    );
  }
}
