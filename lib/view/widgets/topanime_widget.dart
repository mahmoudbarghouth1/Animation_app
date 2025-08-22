import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/widgets/anime_card.dart';
import 'package:sign/core/widgets/loadin_view.dart';
import 'package:sign/view/screens/manga_anime_view/anime_view.dart';
import 'package:sign/viewmodel/providers.dart';

class TopAnimeWidget extends ConsumerWidget {
  const TopAnimeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animeList = ref.watch(animeModelProvider);

    return RefreshIndicator(
      onRefresh: () async {
        return await ref.refresh(mangaViewModelProvider);
      },
      child: animeList.when(
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return Center(child: const LoadingView());
        },
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AnimeView(animeModel: data[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 10.h),
                  child: AnimeCard(animeModel: data[index]),
                ),
              );
            },
          );
        },
      ),
    );
    // return RefreshIndicator(
    //   onRefresh: () => topAnime.getdata(),
    //   child: FutureBuilder(
    //     future: topAnime.getdata(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(child: CircularProgressIndicator());
    //       } else if (snapshot.hasError) {
    //         return Center(child: Text("Error: ${snapshot.error}"));
    //       } else if (snapshot.hasData) {
    //         return ListView.builder(
    //           itemCount: topAnime.topAnimeList.length,
    //           itemBuilder: (context, index) {
    //             return Padding(
    //               padding: const EdgeInsets.symmetric(vertical: 10),
    //               child: GestureDetector(
    //                 onTap: () {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (_) => AnimeView(
    //                         animeModel: topAnime.topAnimeList[index],
    //                       ),
    //                     ),
    //                   );
    //                 },
    //                 child: AnimeCard(animeModel: topAnime.topAnimeList[index]),
    //               ),
    //             );
    //           },
    //         );
    //       } else {
    //         return Center(child: Text("No data found"));
    //       }
    //     },
    //   ),
    // );
  }
}
