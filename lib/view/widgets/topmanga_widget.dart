import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign/core/widgets/loadin_view.dart';
import 'package:sign/core/widgets/manga_card.dart';
import 'package:sign/view/screens/manga_anime_view/manga_view.dart';
import 'package:sign/viewmodel/providers.dart';

class TopMangaWidget extends ConsumerWidget {
  const TopMangaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mangaList = ref.watch(mangaModelProvider);
    ref.watch(mangaViewModelProvider);

    return RefreshIndicator(
      onRefresh: () async {
        return await ref.refresh(mangaViewModelProvider);
      },
      child: mangaList.when(
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
                      builder: (_) => MangaView(mangaModel: data[index]),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsetsGeometry.symmetric(vertical: 10),
                  child: MangaCard(mangaModel: data[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
