import 'package:amateur_football_league_mobile/constant.dart';
import 'package:flutter/material.dart';

class BuildTournamentList extends StatelessWidget {
  const BuildTournamentList({
    Key? key,
    this.image,
    this.name,
    this.gender,
    this.type,
    this.area,
  }) : super(key: key);

  final image;
  final name;
  final gender;
  final type;
  final area;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        border: Border(
            bottom: BorderSide(
                color: kSearchTextColor, width: 1, style: BorderStyle.solid)),
      ),
      padding: EdgeInsets.all(kPadding / 2),
      margin: EdgeInsets.only(bottom: kPadding / 2),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    name.toString(),
                    style: TextStyle(
                      color: kBlackText,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: kPadding / 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                      child: Text(
                        gender.toString(),
                        style: TextStyle(
                          color: kBlackText,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                      child: Text(
                        "|",
                        style: TextStyle(
                          color: kBlackText,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width - 200,
                      child: Text(
                        type.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kBlackText,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: kPadding / 4,
                ),
                Text(
                  name.toString(),
                  style: TextStyle(
                    color: kBlackText,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Image(
                image: NetworkImage(
                    "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"),
                width: 80,
                height: 120,
                fit: BoxFit.cover,
              ),
            ],
          ),
          SizedBox(
            width: kPadding / 2,
          ),
        ],
      ),
    );
  }
}
