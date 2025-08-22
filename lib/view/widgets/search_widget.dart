import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_localizations.dart';
import 'package:sign/core/app_theme.dart';
import 'package:sign/core/widgets/text_field_widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: AppRadius.medium,
              ),
              child: TextFieldWidget(
                controller: searchController,
                hintText: "msg28".tr(context),
                obscureText: false,
                keyboard: TextInputType.multiline,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              // margin: EdgeInsets.all(2),
              padding: EdgeInsets.symmetric(vertical: .5.h),
              // margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.primary,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 57.w),
                      child: Text("msg24".tr(context)),
                    ),
                  ),
                  SizedBox(width: 1.w),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 55.w),
                      child: Text("msg25".tr(context)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),

              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(20.r),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search_sharp, size: 50.w),
                    SizedBox(height: 10.h),
                    Text("msg26".tr(context)),
                    SizedBox(height: 10.h),
                    Text("msg27".tr(context), textAlign: TextAlign.center),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
