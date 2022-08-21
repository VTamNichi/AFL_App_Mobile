import 'package:amateur_football_league_mobile/constant.dart';
import 'package:flutter/material.dart';

class BuildTournamentResults extends StatelessWidget {
  const BuildTournamentResults({
    Key? key,
    this.image,
    this.name,
    this.cloNum,
    this.scoreNum,
    this.title
  }) : super(key: key);

  final image;
  final name;
  final cloNum;
  final scoreNum;
  final title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 70,
      color: title == "" ? kBackgroundColor : kGreyColorD,
      padding: EdgeInsets.all(kPadding / 2),
      margin: EdgeInsets.only(bottom: kPadding / 6),
      child: Row(
        children: [
          title == "" ? Expanded(
            flex: 1,
            child: ClipOval(
              child: Image(
                image: NetworkImage(image.toString().isEmpty
                    ? "https://t3.ftcdn.net/jpg/03/46/83/96/360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws.jpg"
                    : image.toString()),
                width: 40,
                height: 40,
              ),
            ),
          ) : Expanded(flex: 1, child: Container()),
          SizedBox(
            width: kPadding / 5,
          ),
          Expanded(
            flex: 6,
            child: Text(
              name.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: kBlackText,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              cloNum.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: kBlackText,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              scoreNum.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: kBlackText,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
