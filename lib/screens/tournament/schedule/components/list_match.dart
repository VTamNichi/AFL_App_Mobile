import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListMatch extends StatelessWidget {
  ListMatch(
      {Key? key,
      this.name1,
      this.image1,
      this.score1,
      this.name2,
      this.image2,
      this.score2})
      : super(key: key);

  final name1;
  final image1;
  final score1;
  final name2;
  final image2;
  final score2;

  final generalController = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(kPadding / 2, 0, kPadding / 2, 0),
          width: double.infinity,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  name1.toString().isEmpty ? "Chưa có đội" : name1.toString(),
                  style: TextStyle(
                    color: kBlackText,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ClipOval(
                  child: Image(
                    image: NetworkImage(
                      image1.toString().isEmpty
                          ? "https://aobongdathietke.vn/wp-content/uploads/2021/03/Mau-logo-doi-da-banh-bong-da-thiet-ke-dep-nhat-5-800x800.jpg"
                          : image1.toString(),
                    ),
                    width: 30,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    score1.toString() + " - " + score2.toString(),
                    style: TextStyle(
                      color: kBlackText,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ClipOval(
                  child: Image(
                    image: NetworkImage(
                      image2.toString().isEmpty
                          ? "https://aobongdathietke.vn/wp-content/uploads/2021/03/Mau-logo-doi-da-banh-bong-da-thiet-ke-dep-nhat-5-800x800.jpg"
                          : image2.toString(),),
                    width: 30,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  name2.toString().isEmpty ? "Chưa có đội" : name2.toString(),
                  style: TextStyle(
                    color: kBlackText,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: kGreyColor,
          height: 1,
        ),
      ],
    );
  }
}
