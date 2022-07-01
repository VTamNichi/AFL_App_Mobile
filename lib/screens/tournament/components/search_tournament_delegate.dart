import 'package:amateur_football_league_mobile/controllers/tournament_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTournamentDelegate extends SearchDelegate {
  final tournamentController = Get.put(TournamentController());

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () async {
              tournamentController.nameSearchTour.value = '';
              await tournamentController.getListTournament();
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      tournamentController.nameSearchTour.value = query;
      await tournamentController.getListTournament();
    });
    
    close(context, null);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  String get searchFieldLabel => "Tìm giải đấu theo tên";
}
