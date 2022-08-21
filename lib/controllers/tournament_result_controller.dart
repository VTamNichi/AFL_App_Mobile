import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/tournament_result_api.dart';
import 'package:amateur_football_league_mobile/models/TournamentResult.dart';
import 'package:get/get.dart';

class TournamentResultsController extends GetxController {
  final generalController = Get.put(GeneralController());

  RxList<TournamentResults> tournamentResultsList = <TournamentResults>[].obs;
  RxInt countListTournamentResults = 0.obs;
  RxInt tournamentId = 0.obs;

  Future<void> getListTournamentResults() async {
    generalController.isLoading.value = true;
    await TournamentResultsAPI.getListTournamentResults(tournamentId.value);
    generalController.isLoading.value = false;
  }
}
