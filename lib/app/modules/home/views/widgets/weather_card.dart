import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/extensions.dart';
import '../../../../../config/translations/strings_enum.dart';
import '../../../../components/custom_cached_image.dart';
import '../../../../data/models/weather_model.dart';
import '../../../../routes/app_pages.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.WEATHER, arguments: '${weather.location.lat},${weather.location.lon}'),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Text(
                    weather.location.country.toRightCountry(),
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  8.verticalSpace,
                  Text(
                    weather.location.name.toRightCity(),
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  20.verticalSpace,
                  Text(
                    weather.current.condition.text,
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ).animate().slideX(
                duration: 200.ms, begin: -1, curve: Curves.easeInSine,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomCachedImage(
                  imageUrl: weather.current.condition.icon.toHighRes().addHttpPrefix(),
                  fit: BoxFit.cover,
                  width: 100.w,
                  height: 100.h,
                  color: Colors.white,
                ),
                Text(
                  '${weather.current.tempC.round()}${Strings.celsius.tr}',
                  style: theme.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ).animate().slideX(
              duration: 200.ms, begin: 1, curve: Curves.easeInSine,
            ),
          ],
        ),
      ),
    );
  }
}