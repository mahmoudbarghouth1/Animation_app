import 'package:flutter/material.dart';
import 'package:sign/core/widgets/anime_card.dart';
import 'package:sign/viewmodel/anime_view_model.dart';

class TopAnimeWidget extends StatelessWidget {
  final AnimeViewmodel topAnime = AnimeViewmodel();
  TopAnimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: topAnime.getdata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: topAnime.topAnimeList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: AnimeCard(animeModel: topAnime.topAnimeList[index]),
              );
            },
          );
        } else {
          return Center(child: Text("No data found"));
        }
      },
    );
    // return FutureBuilder(
    //   itemCount: topAnime.topAnimeList.length,

    //   itemBuilder: (context, index) {
    //     return AnimeCard(animeModel: topAnime.topAnimeList[index]);
    //   },
    // );
  }
}
