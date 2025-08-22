import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/model/anime_model.dart';

class AnimeCard extends StatelessWidget {
  final AnimeModel animeModel;
  const AnimeCard({super.key, required this.animeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: AppRadius.medium.r,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Row(
            children: [
              SizedBox(
                width: 90.w,
                child: Image.network(animeModel.imageUrl, fit: BoxFit.fill),
              ),
              SizedBox(width: 5.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      animeModel.title,
                      style: appTheme.textTheme.bodySmall,

                      maxLines: 1,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        const Icon(Icons.star_purple500, color: Colors.amber),
                        SizedBox(width: 2.w),
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

                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.r),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: AppRadius.small.r,
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
                        SizedBox(width: 2.w),
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
