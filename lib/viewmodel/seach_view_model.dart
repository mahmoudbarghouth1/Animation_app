import 'dart:convert';
import 'package:sign/core/network_info.dart';
import 'package:http/http.dart' as http;
// import 'dart:developer' show log;

import 'package:sign/model/anime_model.dart';
import 'package:sign/model/manga_model.dart';

class SearchViewmodel {
  final NetworkInfo networkInfo;
  String? message;

  SearchViewmodel({required this.networkInfo});

  //https://api.jikan.moe/v4/anime?q={search_term}
  Future<List<T>> searchData<T>({
    required String searchType,
    required String item,
  }) async {
    final url = Uri.https('api.jikan.moe', '/v4/$searchType', {'q': item});
    if (!await networkInfo.isConnected) {
      throw Exception("no internet please connect ");
    }
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final jsondecoded = jsonDecode(response.body);
      final List data = jsondecoded["data"];
      if (searchType == "anime") {
        return data.map((e) => Data.fromJson(e) as T).toList();
      } else if (searchType == "manga") {
        return data.map((e) => MangaData.fromJson(e) as T).toList();
      }

      //dvxcbvxcbxcb
    } else if (response.statusCode == 400) {
      throw Exception("seerver connection please try again later ");
    } else {
      throw Exception("unexpected error please try again later ");
    }
    throw Exception("unexpected error please try again later ");
  }

  // Future<List> getdata({required String searchType,required String item}) async {
  //   final url = Uri.https('api.jikan.moe', '/v4/$searchType?q={$item}');
  //   if (await networkInfo.isConnected) {
  //     final response = await http.get(
  //       url,
  //       headers: {"Content-Type": "application/json"},
  //     );
  //     if (response.statusCode == 200) {
  //       final jsononDecoded = jsonDecode(response.body);
  //       final List lastresponse = jsononDecoded["data"];
  //       if (searchType == "anime") {
  //         final List<AnimeModel> topAnime = lastresponse
  //             .map((jsonindex) => AnimeModel.fromJason(jsonindex))
  //             .toList();
  //         return topAnime;
  //       } else {
  //         final List<MangaModel> topManga = lastresponse
  //             .map((jsonindex) => MangaModel.fromJason(jsonindex))
  //             .toList();
  //         return topManga;
  //       }
  //     } else if (response.statusCode == 400) {
  //       throw Exception("Server problem, please try again later.");
  //     } else {
  //       throw Exception("Unexpected server error: ${response.statusCode}");
  //     }
  //   } else {
  //     throw Exception(" no internet please connect ");
  //   }
  // }
}
