import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class NoData extends StatelessWidget {
  final String? text;
  const NoData({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Constants.noData, width: 120.w, height: 120.h),
            Text(
              text ?? 'No Data Found!',
              style: Get.theme.textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
