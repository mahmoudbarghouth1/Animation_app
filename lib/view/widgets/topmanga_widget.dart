import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/widgets/manga_card.dart';
import 'package:sign/view/screens/manga_anime_view/manga_view.dart';
// import 'package:sign/viewmodel/manga_view_model.dart';
import 'package:sign/viewmodel/providers.dart';

class TopMangaWidget extends ConsumerWidget {
  const TopMangaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mangaList = ref.watch(mangaProvider);

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(mangaProvider.notifier).getdata();
      },
      child: mangaList.isEmpty
          ? FutureBuilder(
              future: ref.read(mangaProvider.notifier).getdata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      ref.read(mangaProvider.notifier).message.toString(),
                    ),
                  );
                } else {
                  return Center(child: Text("No data found"));
                }
              },
            )
          : ListView.builder(
              itemCount: mangaList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              MangaView(mangaModel: mangaList[index]),
                        ),
                      );
                    },

                    child: MangaCard(mangaModel: mangaList[index]),
                  ),
                );
              },
            ),
    );
  }
}
