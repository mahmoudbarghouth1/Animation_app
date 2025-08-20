import 'package:flutter/material.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/model/manga_model.dart';

class MangaCard extends StatelessWidget {
  final MangaModel mangaModel;
  const MangaCard({super.key, required this.mangaModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: secondryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Image.network(mangaModel.imageUrl, fit: BoxFit.fill),
              ),
              const SizedBox(width: 5),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mangaModel.title,
                      style: appTheme.textTheme.bodySmall,

                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star_purple500, color: Colors.amber),
                        SizedBox(width: 2),
                        Text(
                          mangaModel.score.toString(),
                          style: const TextStyle(color: Colors.amberAccent),
                        ),
                      ],
                    ),

                    Expanded(
                      child: Text(
                        mangaModel.synopsis,
                        overflow: TextOverflow.visible,
                        softWrap: true,

                        style: appTheme.textTheme.bodySmall,
                        maxLines: 2,
                      ),
                    ),

                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            mangaModel.genres1,
                            style: appTheme.textTheme.bodySmall,
                          ),
                        ),
                        // SizedBox(width: 2),
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 10),
                        //   decoration: BoxDecoration(
                        //     color: secondryColor,
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   child: Text(
                        //     animeMOdel.synopsis,
                        //     style: appTheme.textTheme.bodySmall,
                        //   ),
                        // ),
                        // SizedBox(width: 2),
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 10),
                        //   decoration: BoxDecoration(
                        //     color: secondryColor,
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   child: Text(
                        //     animeMOdel.synopsis,
                        //     style: appTheme.textTheme.bodySmall,
                        //   ),
                        // ),
                        SizedBox(width: 2),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
