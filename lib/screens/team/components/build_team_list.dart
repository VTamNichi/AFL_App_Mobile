import 'package:amateur_football_league_mobile/constant.dart';
import 'package:flutter/material.dart';

class BuildTeamList extends StatelessWidget {
  const BuildTeamList({
    Key? key,
    this.image,
    this.name,
    this.number,
    this.gender,
    this.area,
  }) : super(key: key);

  final image;
  final name;
  final number;
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
                  image: NetworkImage(image.toString()),
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
                  style: TextStyle(
                    color: kBlackText,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: kPadding / 4,
                ),
                Text(
                  number.toString() + " thành viên",
                  style: TextStyle(
                    color: kBlackText,
                    fontSize: 16,
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
