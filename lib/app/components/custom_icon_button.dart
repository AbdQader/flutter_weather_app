import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width ?? 55.w,
      height: height ?? 55.h,
      child: Material(
        color: backgroundColor ?? theme.canvasColor,
        shape: CircleBorder(
          side: borderColor != null
            ? BorderSide(color: borderColor!)
            : BorderSide.none
        ),
        child: InkWell(
          onTap: onPressed,
          highlightColor: theme.primaryColor.withOpacity(0.2),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          child: icon,
        ),
      ),
    );
  }
}
