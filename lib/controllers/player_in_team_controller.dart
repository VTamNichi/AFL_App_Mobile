import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/player_in_team_api.dart';
import 'package:amateur_football_league_mobile/models/PlayerInTeamsFull.dart';
import 'package:get/get.dart';

class PlayerInTeamController extends GetxController {
  final generalController = Get.put(GeneralController());

  RxList<PlayerInTeamsFull> playerInTeamList = <PlayerInTeamsFull>[].obs;
  RxInt countListPlayerInTeam = 0.obs;
  RxInt teamId = 0.obs;

  Future<void> getListPlayerInTeam({bool isRefresh = false}) async {
    generalController.isLoading.value = true;
    if (isRefresh) {
      generalController.currentPlayerInTeamPage.value = 1;
    }
    await PlayerInTeamAPI.getListPlayerInTeam(
        teamId.value, generalController.currentPlayerInTeamPage.value);
    generalController.isLoading.value = false;
  }
}
