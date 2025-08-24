import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/model/manga_model.dart';

class MangaView extends StatelessWidget {
  const MangaView({super.key, required this.mangaData});
  final MangaData mangaData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150.h,
                    width: 150.w,
                    child: Image.network(mangaData.images?.jpg?.imageUrl ?? "" ,fit: BoxFit.fill),
                  ),
                  SizedBox(height: 10.h),
                  Text(mangaData.title ?? "", maxLines: 1),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: AppRadius.small.r,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 5.w),
                            Text(mangaData.rank.toString()),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: AppRadius.small.r,
                        ),
                        child: Text(
                          "#"
                          "${mangaData.rank}",
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: AppRadius.small.r,
                        ),
                        child: Text("tv"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 300.w,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.small.r,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("ADD To Favorit"),
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text("Synoposis "),
                      SizedBox(height: 10.h),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: AppRadius.larg.r,
                          color: const Color.fromARGB(255, 19, 28, 111),
                        ),
                        padding: EdgeInsets.all(15.r),

                        child: Text(
                         mangaData.synopsis ?? "",
                          maxLines: 10,
                          style: TextStyle(color: AppColors.white54),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text("Information"),
                      SizedBox(height: 10.h),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: AppRadius.larg.r,
                          color: AppColors.thirdColor,
                        ),
                        height: 205.h,
                        padding: EdgeInsets.all(10.r),

                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 20,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 10,
                              ),
                          children: [
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                borderRadius: AppRadius.small,
                                color: AppColors.primary,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Type"),
                                  const Text("TV Series"),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                borderRadius: AppRadius.small,
                                color: AppColors.primary,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Type"),
                                  const Text("TV Series"),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                borderRadius: AppRadius.small,
                                color: AppColors.primary,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Type"),
                                  const Text("TV Series"),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                borderRadius: AppRadius.small,
                                color: AppColors.primary,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Type"),
                                  const Text("TV Series"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text("Geners "),
                      SizedBox(height: 10.r),
                      Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          borderRadius: AppRadius.larg,
                          color: AppColors.thirdColor,
                        ),
                        height: 70.h,

                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: AppRadius.small.r,
                              ),
                              child: Text(mangaData.genres?[0].name ?? "",),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text("Media"),
                      SizedBox(height: 10.h),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: AppRadius.larg,
                          color: AppColors.thirdColor,
                        ),
                        height: 400.h,
                        padding: EdgeInsets.all(10.r),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
