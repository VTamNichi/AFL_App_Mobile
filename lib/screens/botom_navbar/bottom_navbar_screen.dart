import 'package:amateur_football_league_mobile/screens/botom_navbar/components/bottom_navbar.dart';
import 'package:flutter/material.dart';

class BottomNavbarScreen extends StatelessWidget {
  const BottomNavbarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavbar(),
      ),
    );
  }
}
