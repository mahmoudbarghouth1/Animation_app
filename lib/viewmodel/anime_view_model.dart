import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:developer' show log;

import 'package:sign/model/anime_model.dart';

class AnimeViewmodel {
  List<AnimeModel> topAnimeList = [];
  Future getdata() async {
    final url = Uri.https('api.jikan.moe', '/v4/top/anime');
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    final jsononDecoded = jsonDecode(response.body);
    final List lastresponse = jsononDecoded["data"];
    final List<AnimeModel> topAnime = lastresponse
        .map((jsonindex) => AnimeModel.fromJason(jsonindex))
        .toList();
    if (response.statusCode == 200) {
      topAnimeList = topAnime;
      return true;
    }

    log(topAnime[0].title);
    // log(topanime[0].rank.toString());
    // log(topanime[0].score.toString());
    // log(topanime[0].synopsis);
    // log(topanime[0].imageUrl);
    // log(topanime[0].genres1);
    // log(topanime[0].genres2);
    // log(topanime[0].genres3);
    // log(jsononDecoded.toString());

    // log('Response status: ${response.statusCode}');
    // log('Response body: ${response.headers}');
  }
}
