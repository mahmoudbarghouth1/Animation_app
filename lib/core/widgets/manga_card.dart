import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/model/manga_model.dart';

class MangaCard extends StatelessWidget {
  final MangaModel mangaModel;
  const MangaCard({super.key, required this.mangaModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: AppRadius.medium,
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Row(
            children: [
              SizedBox(
                width: 90.w,
                child: Image.network(mangaModel.imageUrl, fit: BoxFit.fill),
              ),
              SizedBox(width: 5.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mangaModel.title,
                      style: appTheme.textTheme.bodySmall,

                      maxLines: 1,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        const Icon(Icons.star_purple500, color: Colors.amber),
                        SizedBox(width: 2.w),
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

                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.r),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: AppRadius.small,
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
