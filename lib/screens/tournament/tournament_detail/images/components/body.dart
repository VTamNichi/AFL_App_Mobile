import 'package:amateur_football_league_mobile/constant.dart';
import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final imagesController = Get.put(ImagesController());
  final generalController = Get.put(GeneralController());

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getImagesData({bool isRefresh = false}) async {
    if (!isRefresh) {
      if (generalController.currentImagesPage.value >=
          (imagesController.countListImages.value / 8).ceil()) {
        refreshController.loadNoData();
        return true;
      } else {
        generalController.currentImagesPage.value += 1;
      }
    }
    await imagesController.getListImages(isRefresh: isRefresh);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: size.height - 90,
            child: Stack(
              children: [
                imagesController.imagesList.isEmpty
                    ? const Center(
                        child: Text(
                          "Giải đấu chưa có hình ảnh",
                          style: TextStyle(fontSize: 22),
                        ),
                      )
                    : Container(),
                SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  onRefresh: () async {
                    final result = await getImagesData(isRefresh: true);
                    if (result) {
                      refreshController.refreshCompleted();
                    } else {
                      refreshController.refreshFailed();
                    }
                  },
                  onLoading: () async {
                    final result = await getImagesData(isRefresh: false);
                    if (result) {
                      refreshController.loadComplete();
                    } else {
                      refreshController.loadFailed();
                    }
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: imagesController.imagesList.length,
                    itemBuilder: (BuildContext context, index) {
                      String dateCreate = imagesController
                          .imagesList[index].dateCreate
                          .toString()
                          .split(" ")[0];
                      if (index > 0 &&
                          imagesController.imagesList[index].dateCreate
                                  .toString()
                                  .split(" ")[0] ==
                              imagesController.imagesList[index - 1].dateCreate
                                  .toString()
                                  .split(" ")[0]) {
                        dateCreate = "";
                      }
                      return Column(
                        children: [
                          dateCreate == ""
                              ? Container()
                              : Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.fromLTRB(kPadding, kPadding, 0, 0),
                                  child: Text(
                                      "Ngày: " + dateCreate,
                                      style: TextStyle(
                                          color: kBlackText,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                ),
                          Container(
                            padding: EdgeInsets.fromLTRB(kPadding, kPadding, kPadding, 0),
                            child: Image(
                              image: NetworkImage(imagesController
                                  .imagesList[index].imageURL
                                  .toString()),
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      );
                    },
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
