import 'package:amateur_football_league_mobile/fetch_api/team_in_match_api.dart';
import 'package:amateur_football_league_mobile/models/TeamInMatch.dart';
import 'package:get/get.dart';

class TeamInMatchController extends GetxController {
  RxList<TeamInMatch> teamInMatchList = <TeamInMatch>[].obs;
  Rx<TeamInMatch> teamInMatchDetail1 = TeamInMatch().obs;
  Rx<TeamInMatch> teamInMatchDetail2 = TeamInMatch().obs;

  Future<void> getListTeamInMatch(int tourId) async {
    await TeamInMatchAPI.getListTeamInMatch(tourId);
  }
}
