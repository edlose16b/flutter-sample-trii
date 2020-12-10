import 'package:dio/dio.dart';
import 'package:triiapp/data/models/game_model.dart';

class GameRepository {
  String uri = "https://www.freetogame.com/api/games";

  Future<Games> getGames() async {
    final resp = await Dio().get(this.uri);
    return Games.fromJson(resp.data);
  }
}
