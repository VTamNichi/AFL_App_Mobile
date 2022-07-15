import 'package:amateur_football_league_mobile/constant.dart';
import 'package:flutter/material.dart';

class BuildNotificationList extends StatelessWidget {
  const BuildNotificationList({
    Key? key,
    this.content,
    this.isSeen,
    this.dateCreate,
    this.index,
  }) : super(key: key);

  final content;
  final isSeen;
  final dateCreate;
  final index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: kBackgroundColor,
      padding: EdgeInsets.all(kPadding / 2),
      margin: EdgeInsets.only(bottom: kPadding / 6),
      child: Row(
        children: [
          Column(
            children: [
              Icon(
                Icons.notifications,
                size: 40,
                color: index % 3 == 0
                    ? kOrangeColor
                    : index % 2 == 0
                        ? kYellowColor
                        : kBlueColor,
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
                Expanded(
                  child: Text(
                    content.toString(),
                    maxLines: 2,
                    style: TextStyle(
                      color: kBlackText,
                      fontSize: 18,
                      fontWeight: isSeen == false ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                Text(
                  dateCreate.toString(),
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
