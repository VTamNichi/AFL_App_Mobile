import 'package:amateur_football_league_mobile/controllers/general/general_controller.dart';
import 'package:amateur_football_league_mobile/fetch_api/team_in_tournament_api.dart';
import 'package:amateur_football_league_mobile/fetch_api/tournament_api.dart';
import 'package:amateur_football_league_mobile/models/TeamInTournament.dart';
import 'package:get/get.dart';

class TeamInTournamentController extends GetxController {
  final generalController = Get.put(GeneralController());
  RxList<TeamInTournament> teamInTournamentList = <TeamInTournament>[].obs;
  RxInt tourId = 0.obs;

  RxList<TeamInTournament> tournamentOfTeamList = <TeamInTournament>[].obs;
  RxInt teamId = 0.obs;
  RxInt countListTournamentOfTeam = 0.obs;

  Future<void> getListTeamInTournament() async {
    await TeamInTournamentAPI.getListTeamInTournament(tourId.value);
  }

  Future<void> getListTournamentOfTeam({bool isRefresh = false}) async {
    generalController.isLoading.value = true;
    if (isRefresh) {
      generalController.currentTournamentOfTeamPage.value = 1;
    }
    await TeamInTournamentAPI.getListTournamentOfTeam(
        teamId.value, generalController.currentTournamentOfTeamPage.value);
    tournamentOfTeamList.map((element) async {
      await TournamentAPI.getTournamentById(element.tournamentId!)
          .then((value) => {
                element.tournament = value,
              });
      generalController.isLoading.value = false;
    }).toList();
  }
}
