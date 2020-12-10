// To parse this JSON data, do
//
//     final game = gameFromJson(jsonString);

import 'dart:convert';

Game gameFromJson(String str) => Game.fromJson(json.decode(str));

class Game {
  Game({
    this.id,
    this.title,
    this.thumbnail,
    this.shortDescription,
    this.gameUrl,
    this.genre,
    this.platform,
    this.publisher,
    this.developer,
    this.releaseDate,
    this.freetogameProfileUrl,
  });

  int id;
  String title;
  String thumbnail;
  String shortDescription;
  String gameUrl;
  String genre;
  String platform;
  String publisher;
  String developer;
  DateTime releaseDate;
  String freetogameProfileUrl;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        shortDescription: json["short_description"],
        gameUrl: json["game_url"],
        genre: json["genre"],
        platform: json["platform"],
        publisher: json["publisher"],
        developer: json["developer"],
        releaseDate: DateTime.parse(json["release_date"]),
        freetogameProfileUrl: json["freetogame_profile_url"],
      );
}

class Games {
  List<Game> items;

  Games({this.items});

  factory Games.fromJson(dynamic json) {
    List<Game> items = [];
    for (var item in json) {
      items.add(Game.fromJson(item));
    }
    return Games(items: items);
  }
}
