import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/model/anime_model.dart';

class AnimeView extends StatelessWidget {
  const AnimeView({super.key, required this.data});
  final Data data;

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
                    child: Image.network(
                      data.images?.jpg?.imageUrl ?? "",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(data.title ?? "", maxLines: 1),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: AppRadius.small.r,
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 5.w),
                            Text(data.rank.toString()),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.h),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: AppRadius.small.r,
                        ),
                        child: Text(data.score.toString()),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: AppRadius.small.r,
                        ),
                        child: Text(data.score.toString()),
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
                          color: AppColors.grey,
                        ),
                        padding: EdgeInsets.all(15.r),

                        child: Text(
                          data.synopsis ?? "",
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
                          color: AppColors.grey,
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
                          color: AppColors.grey,
                        ),
                        height: 70.h,

                        child: data.genres != null && data.genres!.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.all(8.r),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 2,
                                      ),
                                  itemCount: data.genres!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 5.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: AppRadius.small,
                                      ),
                                      child: Text(data.genres![index].name!),
                                    );
                                  },
                                ),
                              )
                            : SizedBox.shrink(),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  // Column(
                  //   // mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,

                  //   children: [
                  //     const Text("Media"),
                  //     SizedBox(height: 10.h),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(30),
                  //     color: AppColors.grey,
                  //   ),
                  //   // height: 400.h,
                  //   width: double.infinity,
                  //   padding: EdgeInsets.all(10.r),
                  //   child:
                  //       data.titleSynonyms != null &&
                  //           data.titleSynonyms!.isNotEmpty
                  //       ? Padding(
                  //           padding: EdgeInsets.all(8.r),
                  //           child: GridView.builder(
                  //             gridDelegate:
                  //                 SliverGridDelegateWithFixedCrossAxisCount(
                  //                   crossAxisCount: 4,
                  //                   crossAxisSpacing: 10,
                  //                   mainAxisSpacing: 10,
                  //                   childAspectRatio: 2,
                  //                 ),
                  //             itemCount: data.genres!.length,
                  //             itemBuilder: (context, index) {
                  //               return Container(
                  //                 padding: EdgeInsets.symmetric(
                  //                   horizontal: 10.w,
                  //                   vertical: 5.h,
                  //                 ),
                  //                 decoration: BoxDecoration(
                  //                   color: AppColors.primary,
                  //                   borderRadius: AppRadius.small,
                  //                 ),
                  //                 child: Text(data.genres![index].name!),
                  //               );
                  //             },
                  //           ),
                  //         )
                  //       : SizedBox.shrink(),
                  // ),
                  //  ],
                  // ),
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
