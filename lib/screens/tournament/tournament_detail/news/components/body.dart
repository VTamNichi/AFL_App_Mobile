import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/controllers/news_controller.dart';
import 'package:amateur_football_league_mobile/screens/tournament/tournament_detail/news/components/build_news_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final newsController = Get.put(NewsController());
  final generalController = Get.put(GeneralController());

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    super.initState();
  }

  Future<bool> getNewsData({bool isRefresh = false}) async {
    if (!isRefresh) {
      if (generalController.currentNewsPage.value >=
          (newsController.countListNews.value / 8).ceil()) {
        refreshController.loadNoData();
        return true;
      } else {
        generalController.currentNewsPage.value += 1;
      }
    }
    await newsController.getListNews(isRefresh: isRefresh);
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
                newsController.newsList.isEmpty
                    ? const Center(
                        child: Text(
                          "Giải đấu chưa có tin tức",
                          style: TextStyle(fontSize: 22),
                        ),
                      )
                    : Container(),
                SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  onRefresh: () async {
                    final result = await getNewsData(isRefresh: true);
                    if (result) {
                      refreshController.refreshCompleted();
                    } else {
                      refreshController.refreshFailed();
                    }
                  },
                  onLoading: () async {
                    final result = await getNewsData(isRefresh: false);
                    if (result) {
                      refreshController.loadComplete();
                    } else {
                      refreshController.loadFailed();
                    }
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: newsController.newsList.length,
                    itemBuilder: (BuildContext context, index) {
                      return BuildNewsList(
                        image: newsController.newsList[index].newsImage,
                        content: newsController.newsList[index].content,
                        date: newsController.newsList[index].dateCreate,
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
