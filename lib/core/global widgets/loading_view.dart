import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/core/app_theme.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsGeometry.all(10.r),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            SizedBox(
              height: 30.h,
              width: 30.w,
              child: CircularProgressIndicator(color: AppColors.loaderColor),
            ),
            SizedBox(height: 30.h),
            Text("Loading ......", style: appTheme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
