import 'dart:convert';
import 'package:sign/core/network_info.dart';
import 'package:http/http.dart' as http;
// import 'dart:developer' show log;

import 'package:sign/model/anime_model.dart';

class AnimeViewmodel {
  final NetworkInfo networkInfo;
  String? message;

  AnimeViewmodel({required this.networkInfo});
  // List<AnimeModel> topAnimeList = [];
  Future<List<AnimeModel>> getdata() async {
    final url = Uri.https('api.jikan.moe', '/v4/top/anime');

    if (await networkInfo.isConnected) {
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        final jsononDecoded = jsonDecode(response.body);
        final List lastresponse = jsononDecoded["data"];
        final List<AnimeModel> topAnime = lastresponse
            .map((jsonindex) => AnimeModel.fromJason(jsonindex))
            .toList();
        return topAnime;
      } else if (response.statusCode == 400) {
        throw Exception("Server problem, please try again later.");
      } else {
        throw Exception("Unexpected server error: ${response.statusCode}");
      }
    } else {
      throw Exception(" no internet please connect ");
    }
  }
}
