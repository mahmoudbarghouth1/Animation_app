import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/model/anime_model.dart';

class AnimeView extends StatelessWidget {
  const AnimeView({super.key, required this.animeModel});
  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150.h,
                    width: 150.w,
                    child: Image.network(animeModel.imageUrl, fit: BoxFit.fill),
                  ),
                  SizedBox(height: 10.h),
                  Text(animeModel.title, maxLines: 1),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: AppRadius.small.r,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 5.w),
                            Text(animeModel.rank.toString()),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.h),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: AppRadius.small.r,
                        ),
                        child: Text(animeModel.score.toString()),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: AppRadius.small.r,
                        ),
                        child: const Text("9.1"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 300.w,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
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
                          color: AppColors.thirdColor,
                        ),
                        padding: EdgeInsets.all(15.r),

                        child: Text(
                          animeModel.synopsis,
                          maxLines: 10,
                          style: const TextStyle(color: AppColors.white54),
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
                        height: 210.h,
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
                                borderRadius: BorderRadius.circular(10),
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
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
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
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
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
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(255, 19, 28, 111),
                        ),
                        height: 70.h,

                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.h),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: AppRadius.small,
                              ),
                              child: Text(animeModel.genres1),
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
                          borderRadius: BorderRadius.circular(30),
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
