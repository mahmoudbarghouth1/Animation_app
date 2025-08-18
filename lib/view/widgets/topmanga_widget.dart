import 'package:flutter/material.dart';
import 'package:sign/core/widgets/manga_card.dart';
import 'package:sign/view/screens/amanga_view.dart';
import 'package:sign/viewmodel/manga_view_model.dart';

class TopMangaWidget extends StatefulWidget {
  TopMangaWidget({super.key});

  @override
  State<TopMangaWidget> createState() => _TopMangaWidgetState();
}

class _TopMangaWidgetState extends State<TopMangaWidget> {
  final MnagViewmodel topAnime = MnagViewmodel();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => MangaView()));
      },
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            ListView.builder(
              itemCount: topAnime.topMangaList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: MangaCard(mangaModel: topAnime.topMangaList[index]),
                );
              },
            );
          });
        },
        child: FutureBuilder(
          future: topAnime.getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: topAnime.topMangaList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: MangaCard(mangaModel: topAnime.topMangaList[index]),
                  );
                },
              );
            } else {
              return Center(child: Text("No data found"));
            }
          },
        ),
      ),
    );
    // return FutureBuilder(
    //   itemCount: topAnime.topAnimeList.length,

    //   itemBuilder: (context, index) {
    //     return AnimeCard(animeModel: topAnime.topAnimeList[index]);
    //   },
    // );
  }
}
