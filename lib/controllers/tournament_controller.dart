import 'package:amateur_football_league_mobile/fetch_api/tournament_api.dart';
import 'package:amateur_football_league_mobile/models/Tournament.dart';
import 'package:get/get.dart';

class TournamentController extends GetxController {
  Rx<int> selectTournament = 1.obs;
  RxList<Tournament> tournamentList = <Tournament>[].obs;
  RxInt countListTournament = 0.obs;
  RxList listSearchTournament = [
    "Khu vực",
    "Hình thức",
    "Loại giải đấu",
    "Giới Tính",
  ].obs;

  Future<void> getListTournament() async {
    await TournamentAPI.getListTournament("name");
  }
}