import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/translations/strings_enum.dart';
import '../../../../../utils/constants.dart';
import '../../../../components/custom_button.dart';
import '../../controllers/home_controller.dart';

class LocationDialog extends StatelessWidget {
  const LocationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.r),
        ),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 26.w),
      child: Container(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: theme.primaryColor,
              radius: 70.r,
              child: Center(
                child: Image.asset(Constants.logo, width: 103.w, height: 103.h),
              ),
            ).animate().fade().slideY(
              duration: 300.ms,
              begin: -1,
              curve: Curves.easeInSine,
            ),
            24.verticalSpace,
            Text(
              Strings.locationPermissionNeeded.tr,
              style: theme.textTheme.displayMedium,
              textAlign: TextAlign.center,
            ).animate().fade().slideY(
              duration: 300.ms,
              begin: -1,
              curve: Curves.easeInSine,
            ),
            16.verticalSpace,
            Text(
              Strings.pleaseEnableLocationPermission.tr,
              style: theme.textTheme.bodyMedium?.copyWith(height: 1),
              textAlign: TextAlign.center,
            ).animate().fade().slideY(
              duration: 300.ms,
              begin: -1,
              curve: Curves.easeInSine,
            ),
            80.verticalSpace,
            CustomButton(
              onPressed: () {
                Get.back();
                HomeController.instance.getUserLocation();
              },
              text: Strings.allowLocation.tr,
              fontSize: 18.sp,
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.white,
              width: 265.w,
              radius: 30.r,
              verticalPadding: 20.h,
            ).animate().fade().slideY(
              duration: 300.ms,
              begin: 1,
              curve: Curves.easeInSine,
            ),
          ],
        ),
      ),
    );
  }
}