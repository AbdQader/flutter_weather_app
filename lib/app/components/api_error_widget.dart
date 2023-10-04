import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'custom_button.dart';

class ApiErrorWidget extends StatelessWidget {
  const ApiErrorWidget({super.key, this.message, this.retryAction});
  final String? message;
  final Function()? retryAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message ?? 'Something went wrong! please try again later',
            style: Get.theme.textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          30.verticalSpace,
          CustomButton(
            width: 130.w,
            text: 'Try Again',
            onPressed: retryAction,
            fontSize: 16.sp,
            radius: 10.r,
            verticalPadding: 12.h,
            hasShadow: false,
          ),
        ],
      ),
    );
  }
}