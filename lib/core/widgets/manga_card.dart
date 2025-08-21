import 'package:flutter/material.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/model/manga_model.dart';

class MangaCard extends StatelessWidget {
  final MangaModel mangaModel;
  const MangaCard({super.key, required this.mangaModel});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    // final screenOrintation = MediaQuery.of(context).orientation;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * (10 / 370)),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: w * (100 / 400),
                child: Image.network(mangaModel.imageUrl, fit: BoxFit.fill),
              ),
              SizedBox(width: w * (5 / 400)),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mangaModel.title,
                      style: appTheme.textTheme.bodySmall,

                      maxLines: 1,
                    ),
                    SizedBox(height: h * (10 / 800)),
                    Row(
                      children: [
                        const Icon(Icons.star_purple500, color: Colors.amber),
                        SizedBox(width: w * (2 / 400)),
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

                    SizedBox(height: w * (5 / 400)),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * (10 / 400),
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
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
