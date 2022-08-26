import 'package:amateur_football_league_mobile/constant.dart';
import 'package:flutter/material.dart';

class BuildTeamJoiningList extends StatelessWidget {
  const BuildTeamJoiningList({
    Key? key,
    this.image,
    this.name,
    this.gender,
    this.area,
  }) : super(key: key);

  final image;
  final name;
  final gender;
  final area;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 110,
      color: kBackgroundColor,
      padding: EdgeInsets.all(kPadding / 2),
      margin: EdgeInsets.only(bottom: kPadding / 6),
      child: Row(
        children: [
          Column(
            children: [
              ClipOval(
                child: Image(
                  image: NetworkImage(image.toString().isEmpty
                      ? "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"
                      : image.toString()),
                  width: 70,
                  height: 70,
                ),
              ),
            ],
          ),
          SizedBox(
            width: kPadding / 2,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kBlackText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: kPadding,
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
                      width: 20,
                      child: Text(
                        "|",
                        style: TextStyle(
                          color: kBlackText,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width - 200,
                      child: Text(
                        area.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: kBlackText,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
