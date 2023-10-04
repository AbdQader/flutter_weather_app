import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weather_app/utils/extensions.dart';

import '../../../../../config/translations/strings_enum.dart';
import '../../../../../utils/constants.dart';
import '../../../../components/custom_cached_image.dart';
import '../../controllers/weather_controller.dart';
import 'weather_details_item.dart';
import 'weather_row_data.dart';

class WeatherForecast extends GetView<WeatherController> {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: theme.canvasColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text('Weather now', style: theme.textTheme.displayMedium),
          Text(Strings.weatherNow.tr, style: theme.textTheme.displayMedium),
          16.verticalSpace,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                WeatherDetailsItem(
                  //title: 'Wind',
                  title: Strings.wind.tr,
                  icon: Constants.wind,
                  //value: '9',
                  value: controller.weatherDetails.current.windMph.toInt().toString(),
                  text: 'mph',
                ),
                16.horizontalSpace,
                WeatherDetailsItem(
                  //title: 'Pressure',
                  title: Strings.pressure.tr,
                  icon: Constants.pressure,
                  //value: '29',
                  value: controller.weatherDetails.current.pressureIn.toInt().toString(),
                  text: 'inHg',
                  isHalfCircle: true,
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Text(Strings.hoursForecast.tr, style: theme.textTheme.displayMedium),
          16.verticalSpace,
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.forecastday.hour.length,
              itemBuilder: (context, index) => Container(
                /* margin: EdgeInsets.only(
                  right: controller.isEnLang ? 10.w : 0,
                  left: !controller.isEnLang ? 10.w : 0,
                ), */
                margin: EdgeInsetsDirectional.only(end: 10.w),
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      //controller.convertDateToTime(controller.forecastday.hour[index].time),
                      controller.forecastday.hour[index].time.convertToTime(),
                      style: theme.textTheme.bodySmall,
                    ),
                    CustomCachedImage(
                      imageUrl: 'https:${controller.forecastday.hour[index].condition.icon}',
                      fit: BoxFit.cover,
                      width: 50.w,
                      height: 50.h,
                    ),
                    Text(
                      //'${controller.forecastday.hour[index].tempC.toInt().toString()} ℃',
                      '${controller.forecastday.hour[index].tempC.toInt().toString()}${Strings.celsius.tr}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
          16.verticalSpace,
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      //padding: EdgeInsets.all(20.r),
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                //controller.getWindDir(controller.weatherDetails.current.windDir),
                                controller.weatherDetails.current.windDir.getWindDir(),
                                style: theme.textTheme.displayMedium?.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              15.verticalSpace,
                              Text(
                                '${controller.forecastday.day.maxwindKph} ${Strings.kmh.tr}',
                                style: theme.textTheme.displayMedium?.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          RotationTransition(
                          //Transform.rotate(
                            //angle: controller.weatherDetails.current.windDegree * pi / 180,
                            turns: AlwaysStoppedAnimation(controller.weatherDetails.current.windDegree / 360),
                            child: Icon(Icons.north, size: 30, color: theme.iconTheme.color),
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    Container(
                      //padding: EdgeInsets.all(20.r),
                      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildRowData(
                            text: Strings.sunrise.tr,
                            //value: controller.formatTime(controller.forecastday.astro.sunrise),
                            value: controller.forecastday.astro.sunrise.formatTime(),
                          ),
                          5.verticalSpace,
                          _buildRowData(
                            text: Strings.sunset.tr,
                            //value: controller.formatTime(controller.forecastday.astro.sunset),
                            value: controller.forecastday.astro.sunset.formatTime(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              10.horizontalSpace,
              Expanded(
                flex: 6,
                child: Container(
                  //padding: EdgeInsets.all(20.r),
                  padding: EdgeInsets.fromLTRB(15.w, 15.h, 15.w, 10.h),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      WeatherRowData(
                        text: Strings.humidity.tr,
                        value: '${controller.forecastday.day.avghumidity.toInt()}%',
                      ),
                      5.verticalSpace,
                      WeatherRowData(
                        text: Strings.realFeel.tr,
                        value: '${controller.forecastday.day.avgtempC.toInt()}°',
                      ),
                      5.verticalSpace,
                      WeatherRowData(
                        text: Strings.uv.tr,
                        value: '${controller.forecastday.day.uv.toInt()}',
                      ),
                      5.verticalSpace,
                      WeatherRowData(
                        text: Strings.chanceOfRain.tr,
                        value: '${controller.forecastday.day.dailyChanceOfRain}%',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildRowData({required String text, required String value}) {
    return Row(
      children: [
        Text(value, style: Get.theme.textTheme.displayMedium?.copyWith(
          fontSize: 14.sp,
        )),
        10.horizontalSpace,
        Text(text, style: Get.theme.textTheme.displaySmall?.copyWith(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal
        )),
      ],
    );
  }
}