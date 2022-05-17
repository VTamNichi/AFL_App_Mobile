import 'package:amateur_football_league_mobile/constant.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, this.hintext, this.icon, this.onTap})
      : super(key: key);

  final hintext;
  final icon;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
          hintText: hintext,
          icon: Icon(
            icon,
            color: kBlackText,
            size: 30,
          ),
          hintStyle: TextStyle(
            letterSpacing: 2,
            color: kBlackText,
            fontWeight: FontWeight.bold,
          ),
          fillColor: kBackgroundColor,
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none)),
    );
  }
}
