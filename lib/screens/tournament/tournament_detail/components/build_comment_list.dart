import 'package:amateur_football_league_mobile/constant.dart';
import 'package:flutter/material.dart';

class BuildCommentList extends StatelessWidget {
  const BuildCommentList({
    Key? key,
    this.image,
    this.name,
    this.content,
    this.date,
  }) : super(key: key);

  final image;
  final name;
  final content;
  final date;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 120,
      padding: EdgeInsets.all(kPadding / 3),
      margin: EdgeInsets.only(bottom: kPadding / 2),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image(
                  image: NetworkImage(image.toString()),
                  width: 70,
                  height: 70,
                ),
              ),
              SizedBox(
                width: kPadding / 2,
              ),
              Expanded(
                child: Container(
                  height: 80,
                  color: kWhiteComment,
                  padding: EdgeInsets.only(left: kPadding / 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.toString(),
                        style: TextStyle(
                          color: kBlackText,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: kPadding / 3,
                      ),
                      Text(
                        content.toString(),
                        style: TextStyle(
                          color: kBlackText,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              Text(
                date.toString(),
                style: TextStyle(
                  color: kGreyColor,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
