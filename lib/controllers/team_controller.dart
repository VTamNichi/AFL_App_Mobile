import 'package:amateur_football_league_mobile/fetch_api/team_api.dart';
import 'package:amateur_football_league_mobile/models/Team.dart';
import 'package:get/get.dart';

class TeamController extends GetxController {
  Rx<int> selectTeam = 1.obs;
  RxList<Team> teamList = <Team>[].obs;
  RxInt countListTeam = 0.obs;
  RxList listSearchTeam = [
    "Khu vực",
    "Giới Tính",
    "000",
    "Abmmmc",
    "Bcnd",
    "000",
    "Abmmmc",
    "Bcnd",
    "000",
  ].obs;
  
  Future<void> getListTeam() async {
    await TeamAPI.getListTeam("name");
  }
}