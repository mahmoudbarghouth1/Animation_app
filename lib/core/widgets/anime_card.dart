import 'package:flutter/material.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/model/anime_model.dart';

class AnimeCard extends StatelessWidget {
  final AnimeModel animeModel;
  const AnimeCard({super.key, required this.animeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                width: 100,
                child: Image.network(animeModel.imageUrl, fit: BoxFit.fill),
              ),
              const SizedBox(width: 5),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animeModel.title,
                      style: appTheme.textTheme.bodySmall,

                      maxLines: 1,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.star_purple500, color: Colors.amber),
                        const SizedBox(width: 2),
                        Text(
                          animeModel.score.toString(),
                          style: TextStyle(color: Colors.amberAccent),
                        ),
                      ],
                    ),

                    Expanded(
                      child: Text(
                        animeModel.synopsis,
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
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            animeModel.genres1,
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
                        const SizedBox(width: 2),
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
