import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sign/core/network_info.dart';
import 'package:sign/model/anime_model.dart';
import 'package:sign/model/manga_model.dart';
import 'package:sign/model/user_model.dart';
import 'package:sign/viewmodel/anime_view_model.dart';
import 'package:sign/viewmodel/auth_view_model.dart';
import 'package:sign/viewmodel/manga_view_model.dart';

final authViewerModelProvider =
    StateNotifierProvider<AuthViewModel, UserModel?>((ref) => AuthViewModel());
final bottomNavigatorProvider = StateProvider<int>((ref) => 0);
// final mangaProvider = StateNotifierProvider<ManagaViewModel, List<MangaModel>>(
//   (ref) => ManagaViewModel(),
// );

final networkInfoProvider = Provider((ref) {
  return NetworkInfo(
    internetConnectionChecker: InternetConnectionChecker.createInstance(),
  );
});

final animeViewModelProvider = Provider<AnimeViewmodel>((ref) {
  return AnimeViewmodel(networkInfo: ref.read(networkInfoProvider));
});
final animeModelProvider = FutureProvider<List<AnimeModel>>((ref) {
  final animList = ref.read(animeViewModelProvider);

  return animList.getdata();
});
final mangaViewModelProvider = Provider<ManagaViewModel>((ref) {
  return ManagaViewModel(networkInfo: ref.read(networkInfoProvider));
});
final mangaModelProvider = FutureProvider<List<MangaModel>>((ref) {
  final mangaList = ref.read(mangaViewModelProvider);

  return mangaList.getdata();
});
