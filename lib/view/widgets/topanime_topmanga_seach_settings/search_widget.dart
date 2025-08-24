import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/widgets/anime_card.dart';
import 'package:sign/core/widgets/loading_view.dart';
import 'package:sign/core/widgets/manga_card.dart';
import 'package:sign/core/widgets/text_field_widget.dart';
import 'package:sign/view/screens/manga_anime_view/anime_view.dart';
import 'package:sign/viewmodel/providers.dart';

class SearchWidget extends ConsumerStatefulWidget {
  const SearchWidget({super.key});

  @override
  ConsumerState<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends ConsumerState<SearchWidget> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      ref.read(searchTextProvider.notifier).state = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final choice = ref.watch(choiceProvider);
    final search = ref.watch(searchTextProvider);
    final AsyncValue<List<dynamic>> searchList = choice == "anime"
        ? ref.watch(futureAnimeSearchProvider(search))
        : ref.watch(futureMangSearchProvider(search));

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: AppRadius.medium,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      controller: searchController,
                      hintText: "msg28".tr(context),
                      obscureText: false,
                      keyboard: TextInputType.multiline,
                      onChanged: _onSearchChanged,
                    ),
                  ),

                  SizedBox(width: 3.w),
                  IconButton(
                    onPressed: () {
                      ref.read(searchTextProvider.notifier).state =
                          searchController.text.trim();
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 2.w),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ref.watch(choiceProvider.notifier).state = "anime";
                      },
                      child: Container(
                        // padding: EdgeInsets.symmetric(vertical: 5.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: choice == "anime"
                              ? AppColors.primary
                              : AppColors.secondary,
                        ),

                        child: Text("msg24".tr(context)),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        ref.watch(choiceProvider.notifier).state = "manga";
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: choice == "manga"
                              ? AppColors.primary
                              : AppColors.secondary,
                        ),

                        child: Text("msg25".tr(context)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),

            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),

                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(20.r),
                ),

                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: (search.trim().isEmpty)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.search_sharp, size: 50.w),
                            SizedBox(height: 10.h),
                            Text("msg26".tr(context)),
                            SizedBox(height: 10.h),
                            Text(
                              "msg27".tr(context),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20.h),
                          ],
                        )
                      : RefreshIndicator(
                          onRefresh: () async {
                            return await ref.refresh(
                              choice == "anime"
                                  ? futureAnimeSearchProvider(search)
                                  : futureMangSearchProvider(search),
                            );
                          },
                          child: searchList.when(
                            error: (error, stackTrace) {
                              return Center(child: Text(error.toString()));
                            },
                            loading: () {
                              return Center(child: const LoadingView());
                            },
                            data: (data) {
                              return ListView.separated(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return choice == "anime"
                                      ? GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => AnimeView(
                                                  data: data[index],
                                                ),
                                              ),
                                            );
                                          },
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) => AnimeView(
                                                    data: data[index],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: AnimeCard(data: data[index]),
                                          ),
                                        )
                                      : MangaCard(mangaData: data[index]);
                                },
                                separatorBuilder: (context, index) {
                                  return Divider(
                                    color: AppColors.primary,
                                    height: 10.h,
                                    thickness: 1.h,
                                  );
                                },
                              );
                            },
                            // ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
