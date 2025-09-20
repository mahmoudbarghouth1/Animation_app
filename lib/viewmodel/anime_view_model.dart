import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/api_constants.dart';
import 'package:sign/core/network_info.dart';
import 'package:http/http.dart' as http;
// import 'dart:developer' show log;

import 'package:sign/model/anime_model.dart';

class AnimeViewmodel {
  final NetworkInfo networkInfo;
  String? message;

  AnimeViewmodel({required this.networkInfo});
  // List<AnimeModel> topAnimeList = [];
  Future<List<Data>> getdata() async {
    final url = Uri.https(
      ApiConstants.baseurl,
      ApiConstants.path + ApiConstants.topAnime,
    );

    if (await networkInfo.isConnected) {
      final response = await http.get(
        url,
        headers: {"Content-Type": ApiConstants.contentType},
      );
      if (response.statusCode == ApiConstants.successStatusCode) {
        final jsononDecoded = jsonDecode(response.body);
        final List lastresponse = jsononDecoded["data"];
        final List<Data> topAnime = lastresponse
            .map((jsonindex) => Data.fromJson(jsonindex))
            .toList();
        return topAnime;
      } else if (response.statusCode == ApiConstants.badRequestStatusCode) {
        throw Exception("Server problem, please try again later.");
      } else {
        throw Exception("Unexpected server error: ${response.statusCode}");
      }
    } else {
      throw Exception(" no internet please connect ");
    }
  }
}

// class AnimeViewmodel {
//   String? message;
//   Future<List<Data>> getdata() async {
//     final url = Uri.https('api.jikan.moe', '/v4/top/anime');
//     final response = await http.get(
//       url,
//       headers: {"Content-Type": "application/json"},
//     );
//     log(response.body.toString());
//     if (response.statusCode == 200) {
//       final jsonDecoded = jsonDecode(response.body);
//       final List<dynamic> lastResponse = jsonDecoded["data"];
//       final List<Data> topAnime = lastResponse
//           .map((json) => Data.fromJson(json))
//           .toList();

//       return topAnime;
//     } else if (response.statusCode == 400) {
//       throw Exception("Server problem, please try again later.");
//     } else {
//       throw Exception("Unexpected server error: ${response.statusCode}");
//     }
//   }
// }

// // things that could be done:

// // 1. Create proper interfaces for better testability
// abstract class IAnimeRepository {
//   Future<List<AnimeModel>> getTopAnime();
// }

// abstract class IAnimeViewModel {
//   Future<void> fetchTopAnime();
//   AnimeState get state;
// }

// // 2. Create proper state management
// sealed class AnimeState {
//   const AnimeState();
// }

// class AnimeInitial extends AnimeState {}
// class AnimeLoading extends AnimeState {}
// class AnimeLoaded extends AnimeState {
//   final List<AnimeModel> animeList;
//   const AnimeLoaded(this.animeList);
// }
// class AnimeError extends AnimeState {
//   final String message;
//   const AnimeError(this.message);
// }



// // 4. Improved repository implementation
// class AnimeRepository implements IAnimeRepository {
//   final http.Client _httpClient;
//   final NetworkInfo _networkInfo;
  
//   AnimeRepository({
//     required http.Client httpClient,
//     required NetworkInfo networkInfo,
//   }) : _httpClient = httpClient, _networkInfo = networkInfo;
  
//   @override
//   Future<List<AnimeModel>> getTopAnime() async {
//     if (!await _networkInfo.isConnected) {
//       throw const NetworkException('No internet connection. Please connect.');
//     }
    
//     try {
//       final url = Uri.https(ApiConstants.baseurl, ApiConstants.topAnimeEndpoint);
//       final response = await _httpClient.get(
//         url,
//         headers: {HttpHeaders.contentTypeHeader: ApiConstants.contentType},
//       );
      
//       if (response.statusCode == ApiConstants.successStatusCode) {
//         final jsonDecoded = jsonDecode(response.body);
//         final List<dynamic> data = jsonDecoded['data'] as List<dynamic>;
        
//         return data.map((json) => AnimeModel.fromJson(json)).toList();
//       } else if (response.statusCode == ApiConstants.badRequestStatusCode) {
//         throw const ServerException('Server problem, please try again later.');
//       } else {
//         throw ServerException('Unexpected server error: ${response.statusCode}');
//       }
//     } on FormatException {
//       throw const DataException('Invalid data format received from server.');
//     } catch (e) {
//       if (e is NetworkException || e is ServerException || e is DataException) {
//         rethrow;
//       }
//       throw const DataException('An unexpected error occurred.');
//     }
//   }
// }

// // 5. Improved ViewModel with proper MVVM
// class AnimeViewModel extends StateNotifier<AnimeState> implements IAnimeViewModel {
//   final IAnimeRepository _repository;
  
//   AnimeViewModel(this._repository) : super(AnimeInitial());
  
//   @override
//   Future<void> fetchTopAnime() async {
//     state = AnimeLoading();
//     try {
//       final animeList = await _repository.getTopAnime();
//       state = AnimeLoaded(animeList);
//     } catch (e) {
//       state = AnimeError(e.toString());
//     }
//   }
  
//   @override
//   AnimeState get state => super.state;
// }

// // 6. Custom exceptions for better error handling
// class NetworkException implements Exception {
//   final String message;
//   const NetworkException(this.message);
  
//   @override
//   String toString() => message;
// }

// class ServerException implements Exception {
//   final String message;
//   const ServerException(this.message);
  
//   @override
//   String toString() => message;
// }

// class DataException implements Exception {
//   final String message;
//   const DataException(this.message);
  
//   @override
//   String toString() => message;
// }
