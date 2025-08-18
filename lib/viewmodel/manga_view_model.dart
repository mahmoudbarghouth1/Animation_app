import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:developer' show log;

import 'package:sign/model/manga_model.dart';

class MnagViewmodel {
  List<MangaModel> topMangaList = [];
  Future getdata() async {
    final url = Uri.https('api.jikan.moe', '/v4/top/manga');
    final response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    final jsononDecoded = jsonDecode(response.body);
    final List lastresponse = jsononDecoded["data"];
    final List<MangaModel> topManga = lastresponse
        .map((jsonindex) => MangaModel.fromJason(jsonindex))
        .toList();
    if (response.statusCode == 200) {
      topMangaList = topManga;
      return true;
    }

    log(topManga[0].title);
    // log(topManga[0].rank.toString());
    // log(topManga[0].score.toString());
    // log(topManga[0].synopsis);
    // log(topManga[0].imageUrl);
    // log(topanime[0].genres1);
    // log(topanime[0].genres2);
    // log(topanime[0].genres3);
    // log(jsononDecoded.toString());

    // log('Response status: ${response.statusCode}');
    // log('Response body: ${response.headers}');
  }
}
