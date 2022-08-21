import 'package:amateur_football_league_mobile/fetch_api/team_in_tournament_api.dart';
import 'package:amateur_football_league_mobile/models/TeamInTournament.dart';
import 'package:get/get.dart';

class TeamInTournamentController extends GetxController {
  RxList<TeamInTournament> teamInTournamentList = <TeamInTournament>[].obs;
  RxInt tourId = 0.obs;

  Future<void> getListTeamInTournament() async {
    await TeamInTournamentAPI.getListTeamInTournament(tourId.value);
  }
}
