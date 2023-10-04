import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WeatherRowData extends StatelessWidget {
  final String text;
  final String value;
  const WeatherRowData({super.key, required this.text, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text, style: theme.textTheme.displaySmall?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal
              ),
            ),
            Text(
              value, style: theme.textTheme.displayMedium?.copyWith(
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}