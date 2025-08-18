import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' show log;

import 'package:sign/model/manga_model.dart';

class ManagaViewModel extends StateNotifier<List<MangaModel>> {
  ManagaViewModel() : super([]);
  // List<MangaModel> topMangaList = [];
  String? message;

  Future getdata() async {
    final url = Uri.https('api.jikan.moe', '/v4/top/manga');

    try {
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
        state = topManga;
        message = "succesfully";
      } else if (response.statusCode == 400) {
        message = "server problem please try again ";
      }
    } catch (e) {
      message = " unknown errore";
    }
  }
}
