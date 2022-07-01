import 'package:amateur_football_league_mobile/controllers/team_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTeamDelegate extends SearchDelegate {
  final teamController = Get.put(TeamController());

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () async {
              teamController.nameSearchTeam.value = '';
              await teamController.getListTeam();
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
      teamController.nameSearchTeam.value = query;
            await teamController.getListTeam();
    });
    
    close(context, null);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  String get searchFieldLabel => "Tìm đội bóng theo tên";
}