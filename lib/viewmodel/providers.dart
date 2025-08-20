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

// things that could be done:

// 1. Fix typos and naming inconsistencies
// final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>((ref) => AuthViewModel());
// final bottomNavigationProvider = StateProvider<int>((ref) => 0);

// 2. Create proper provider families for dynamic data
// final animeViewModelProvider = StateNotifierProvider<AnimeViewModel, AnimeState>((ref) {
//   return AnimeViewModel(
//     repository: ref.read(animeRepositoryProvider),
//   );
// });

// final animeRepositoryProvider = Provider<IAnimeRepository>((ref) {
//   return AnimeRepository(
//     httpClient: ref.read(httpClientProvider),
//     networkInfo: ref.read(networkInfoProvider),
//   );
// });

// 3. Add proper error handling providers
// final authErrorProvider = Provider<String?>((ref) {
//   final authState = ref.watch(authViewModelProvider);
//   if (authState is AuthError) return authState.message;
//   return null;
// });

// final authLoadingProvider = Provider<bool>((ref) {
//   final authState = ref.watch(authViewModelProvider);
//   return authState is AuthLoading;
// });

// 4. Add loading state providers
// final animeLoadingProvider = Provider<bool>((ref) {
//   final animeState = ref.watch(animeViewModelProvider);
//   return animeState is AnimeLoading;
// });

// final animeErrorProvider = Provider<String?>((ref) {
//   final animeState = ref.watch(animeViewModelProvider);
//   if (animeState is AnimeError) return animeState.message;
//   return null;
// });

// 5. Add proper dependency injection
// final httpClientProvider = Provider<http.Client>((ref) => http.Client());

// final firebaseAuthProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

// 6. Add provider families for search functionality
// final searchAnimeProvider = FutureProvider.family<List<AnimeModel>, String>((ref, query) async {
//   final repository = ref.read(animeRepositoryProvider);
//   return repository.searchAnime(query);
// });

// 7. Add caching providers
// final animeCacheProvider = StateProvider<Map<String, List<AnimeModel>>>((ref) => {});

// 8. Add proper error boundaries
// final globalErrorProvider = StateProvider<String?>((ref) => null);

// 9. Add theme and localization providers
// final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
// final localeProvider = StateProvider<Locale>((ref) => const Locale('en'));

// 10. Add user preferences providers
// final userPreferencesProvider = StateNotifierProvider<UserPreferencesNotifier, UserPreferences>((ref) {
//   return UserPreferencesNotifier();
// });
