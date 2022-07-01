import 'package:amateur_football_league_mobile/controllers/football_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFootballPlayerDelegate extends SearchDelegate {
  final footballPlayerController = Get.put(FootballPlayerController());

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () async {
              footballPlayerController.nameSearchFootballPlayer.value = '';
              await footballPlayerController.getListFootballPlayer();
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
      footballPlayerController.nameSearchFootballPlayer.value = query;
            await footballPlayerController.getListFootballPlayer();
    });
    
    close(context, null);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  @override
  String get searchFieldLabel => "Tìm cầu thủ theo tên";
}