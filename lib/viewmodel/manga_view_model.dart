import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sign/core/api_constants.dart';
import 'package:sign/core/network_info.dart';

import 'package:sign/model/manga_model.dart';

class ManagaViewModel {
  final NetworkInfo networkInfo;
  String? message;

  ManagaViewModel({required this.networkInfo});

  Future<List<MangaData>> getdata() async {
    final url = Uri.https(
      ApiConstants.baseurl,
      ApiConstants.path + ApiConstants.topManga,
    );

    if (await networkInfo.isConnected) {
      final response = await http.get(
        url,
        headers: {"Content-Type": ApiConstants.contentType},
      );
      if (response.statusCode == ApiConstants.successStatusCode) {
        final jsononDecoded = jsonDecode(response.body);
        final List lastresponse = jsononDecoded["data"];
        final List<MangaData> topManga = lastresponse
            .map((jsonindex) => MangaData.fromJson(jsonindex))
            .toList();
        return topManga;
      } else if (response.statusCode == ApiConstants.badRequestStatusCode) {
        throw ("Server problem, please try again later.");
      } else {
        throw ("Unexpected server error: ${response.statusCode}");
      }
    } else {
      throw (" no internet please connect ");
    }
  }
  // ManagaViewModel() : super([]);
  // // List<MangaModel> topMangaList = [];
  // String? message;

  // Future getdata() async {
  //   final url = Uri.https('api.jikan.moe', '/v4/top/manga');

  //   try {
  //     final response = await http.get(
  //       url,
  //       headers: {"Content-Type": "application/json"},
  //     );
  //     final jsononDecoded = jsonDecode(response.body);
  //     final List lastresponse = jsononDecoded["data"];
  //     final List<MangaModel> topManga = lastresponse
  //         .map((jsonindex) => MangaModel.fromJason(jsonindex))
  //         .toList();

  //     if (response.statusCode == 200) {
  //       state = topManga;
  //       message = "succesfully";
  //     } else if (response.statusCode == 400) {
  //       message = "server problem please try again ";
  //     }
  //   } catch (e) {
  //     message = " unknown errore";
  //   }
  // }
}
