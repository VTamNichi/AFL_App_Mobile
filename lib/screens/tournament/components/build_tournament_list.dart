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
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width - 200,
                      child: Text(
                        type.toString(),
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
                Expanded(
                  child: Text(
                    area.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: TextStyle(
                      color: kBlackText,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Image(
                image: NetworkImage(image.toString()),
                width: 100,
                height: 150,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
