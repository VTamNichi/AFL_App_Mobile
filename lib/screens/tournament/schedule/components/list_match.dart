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
      this.penalty1,
      this.name2,
      this.image2,
      this.score2,
      this.penalty2,
      this.isLive})
      : super(key: key);

  final name1;
  final image1;
  final score1;
  final penalty1;
  final name2;
  final image2;
  final score2;
  final penalty2;
  final isLive;

  final generalController = Get.put(GeneralController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
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
                      name1.toString().isEmpty
                          ? "Chưa có đội"
                          : name1.toString(),
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
                          image1.toString(),
                        ),
                        width: 30,
                        height: 40,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          "assets/images/team_default.jpg",
                          width: 30,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            score1.toString() + " - " + score2.toString(),
                            style: TextStyle(
                              color: kBlackText,
                              fontSize: 18,
                            ),
                          ),
                          penalty1 != "null"
                              ? Text(
                                  "(" +
                                      penalty1.toString() +
                                      " - " +
                                      penalty2.toString() +
                                      ")",
                                  style: TextStyle(
                                    color: kBlackText,
                                    fontSize: 14,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ClipOval(
                      child: Image(
                        image: NetworkImage(
                          image2.toString(),
                        ),
                        width: 30,
                        height: 40,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          "assets/images/team_default.jpg",
                          width: 30,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      name2.toString().isEmpty
                          ? "Chưa có đội"
                          : name2.toString(),
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
        ),
        isLive == "live"
            ? Positioned(
                left: size.width - 220,
                child: const Image(
                  image: AssetImage("assets/images/instagram-live.png"),
                  width: 40,
                  height: 40,
                ),
              )
            : Container(),
      ],
    );
  }
}
