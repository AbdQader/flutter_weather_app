import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/extensions.dart';
import '../../../../../config/translations/strings_enum.dart';
import '../../../../components/custom_cached_image.dart';
import '../../../../data/models/weather_details_model.dart';

class WeatherDetailsCard extends StatelessWidget {
  final WeatherDetailsModel weatherDetails;
  final Forecastday forecastDay;
  const WeatherDetailsCard({
    super.key,
    required this.weatherDetails,
    required this.forecastDay,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        children: [
          30.verticalSpace,
          CustomCachedImage(
            imageUrl: forecastDay.day.condition.icon.toHighRes().addHttpPrefix(),
            fit: BoxFit.cover,
            width: 150.w,
            height: 150.h,
            color: Colors.white,
          ),
          30.verticalSpace,
          Text(
            '${weatherDetails.location.name.toRightCity()}, ${weatherDetails.location.country.toRightCountry()}',
            style: theme.textTheme.displaySmall?.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          12.verticalSpace,
          Text(
            '${forecastDay.day.maxtempC.toInt()}${Strings.celsius.tr}',
            style: theme.textTheme.displaySmall?.copyWith(
              fontSize: 64.sp,
              color: Colors.white,
            ),
          ),
          16.verticalSpace,
          Text(
            forecastDay.day.condition.text,
            style: theme.textTheme.displaySmall?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}