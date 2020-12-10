import 'package:flutter/material.dart';
import 'package:triiapp/data/models/game_model.dart';
import 'package:triiapp/data/repositories/game_repository.dart';

class HomeBloc extends ChangeNotifier {
  List<Game> _games;

  String _filterByName = "";

  List<Game> get gamesShowing {
    return _games
            ?.where((game) =>
                game.title.toLowerCase().contains(_filterByName.toLowerCase()))
            ?.toList() ??
        [];
  }

  void fetchGames() async {
    GameRepository gameRepository = GameRepository();

    final games = await gameRepository.getGames();

    _games = games.items;

    notifyListeners();
  }

  set filterByName(String value) {
    _filterByName = value;
    notifyListeners();
  }
}
