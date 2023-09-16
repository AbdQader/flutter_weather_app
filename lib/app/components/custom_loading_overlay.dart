import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/* showLoadingOverLay({
  required Future<dynamic> Function() asyncFunction, String? msg}) async {
  await Get.showOverlay(asyncFunction: () async {
    try {
      await asyncFunction();
    } catch(error) {
      //rethrow;
      Logger().e(error);
      //Logger().e(StackTrace.current);
    }
  },
  loadingWidget: Center(
    child: LoadingIndicator(msg: msg),
  ),
  opacity: 0.7,
    opacityColor: Colors.black,
  );
} */

class LoadingIndicator extends StatelessWidget {
  final String? msg;
  const LoadingIndicator({super.key, this.msg});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 40.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SpinKitCubeGrid(
            color: theme.primaryColor,
            size: 30.0,
          ),
          30.verticalSpace,
          Text(msg ?? 'Loading...', style: theme.textTheme.displayMedium),
        ],
      ),
    );
  }
}