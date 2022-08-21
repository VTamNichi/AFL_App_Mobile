import 'package:amateur_football_league_mobile/constant.dart';
import 'package:flutter/material.dart';

class BuildNewsList extends StatelessWidget {
  const BuildNewsList({
    Key? key,
    this.image,
    this.content,
    this.date,
  }) : super(key: key);

  final image;
  final content;
  final date;

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content.toString(),
                  style: TextStyle(
                    color: kBlackText,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: kPadding / 4,
                ),
                Text(
                  "Ngày đăng: " + date.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kGreyColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
