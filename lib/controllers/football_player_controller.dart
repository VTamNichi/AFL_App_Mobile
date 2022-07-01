import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/football_player_api.dart';
import 'package:amateur_football_league_mobile/models/FootballPlayer.dart';
import 'package:get/get.dart';

class FootballPlayerController extends GetxController {
  final generalController = Get.put(GeneralController());
  
  Rx<int> selectFootballPlayer = 1.obs;

  RxList<FootballPlayer> footballPlayerList = <FootballPlayer>[].obs;
  RxInt countListFootballPlayer = 0.obs;
  Rx<FootballPlayer> footballPlayerDetail = FootballPlayer().obs;
  RxList listFootballPlayerDetail = [
    "Đội bóng tham gia",
    "Giải đấu tham gia",
    "Lịch thi đấu",
    "Thành tích"
  ].obs;

  RxList listSearchFootballPlayer = [
    "Giới tính",
    "Vị trí"
  ].obs;

  RxString sortFootballPlayerType = "".obs;
  RxString sortFootballPlayerBy = "".obs;
  //RxBool sortType = true.obs;
  //RxBool sortNameType = true.obs;

  RxString nameSearchFootballPlayer = "".obs;
  RxString genderSearchFootballPlayer = "".obs;
  RxString positionSearchFootballPlayer = "".obs;

  Future<void> getListFootballPlayer({bool isRefresh = false}) async {
    generalController.isLoading.value = true;
    if (isRefresh) {
      generalController.currentFootballPlayerPage.value = 1;
    }
    await FootballPlayerAPI.getListFootballPlayer(
        nameSearchFootballPlayer.value,
        genderSearchFootballPlayer.value,
        positionSearchFootballPlayer.value,
        sortFootballPlayerBy.value,
        sortFootballPlayerType.value,
        generalController.currentFootballPlayerPage.value);
    generalController.isLoading.value = false;
  }
}
