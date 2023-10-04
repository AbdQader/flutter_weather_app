import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:weather_app/app/components/custom_loading_overlay.dart';
import 'package:weather_app/utils/extensions.dart';

import '../../../../config/translations/localization_service.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../data/models/weather_details_model.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';

class WeatherController extends GetxController {
  static WeatherController get instance => Get.find();

  // get the current language code
  final currentLanguage = LocalizationService.getCurrentLocal().languageCode;

  // hold the weather details & forecast day
  late WeatherDetailsModel weatherDetails;
  late Forecastday forecastday;

  // for update
  final dotIndicatorsId = 'DotIndicators';
  
  // for weather forecast
  final days = 3;
  //var selectedDay = 'Today';
  var selectedDay = Strings.today.tr;

  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  // for weather card slider
  late PageController pageController;
  
  // for weather slider and dot indicator
  var currentPage = 0;

  @override
  void onInit() async {
    pageController = PageController(
      initialPage: currentPage, viewportFraction: 0.8,
    );
    //getWeatherDetails();
    //await getWeatherDetails2();
    super.onInit();
  }
  
  @override
  void onReady() {
    getWeatherDetails();
    super.onReady();
  }

  /// get current language
  bool get isEnLang => currentLanguage == 'en';

  getWeatherDetails2() async {
    apiCallStatus = ApiCallStatus.loading;
    update();
    try {
      await Future.delayed(const Duration(seconds: 3));
      weatherDetails = WeatherDetailsModel.fromJson(
        await loadJson('assets/data/weather.json')
      );
      forecastday = weatherDetails.forecast.forecastday[0];
      apiCallStatus = ApiCallStatus.success;
      update();
    } catch(error) {
      apiCallStatus = ApiCallStatus.error;
      update();
    }
  }
  loadJson(String asset) async {
    String data = await rootBundle.loadString(asset);
    return json.decode(data);
  }

  /// get weather details
  /* getWeatherDetails() async {
    await BaseClient.safeApiCall(
      Constants.forecastWeatherApiUrl,
      RequestType.get,
      queryParameters: {
        Constants.key: Constants.apiKey,
        Constants.q: Get.arguments,
        Constants.days: days,
        Constants.lang: currentLanguage,
      },
      onLoading: () {
        apiCallStatus = ApiCallStatus.loading;
        update();
      },
      onSuccess: (response) {
        weatherDetails = WeatherDetailsModel.fromJson(response.data);
        forecastday = weatherDetails.forecast.forecastday[0];
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      onError: (error) {
        BaseClient.handleApiError(error);
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  } */
  getWeatherDetails() async {
    await showLoadingOverLay(
      asyncFunction: () async => await BaseClient.safeApiCall(
        Constants.forecastWeatherApiUrl,
        RequestType.get,
        queryParameters: {
          Constants.key: Constants.apiKey,
          Constants.q: Get.arguments,
          Constants.days: days,
          Constants.lang: currentLanguage,
        },
        onSuccess: (response) {
          weatherDetails = WeatherDetailsModel.fromJson(response.data);
          forecastday = weatherDetails.forecast.forecastday[0];
          apiCallStatus = ApiCallStatus.success;
          update();
        },
        onError: (error) {
          BaseClient.handleApiError(error);
          apiCallStatus = ApiCallStatus.error;
          update();
        },
      ),
    );
  }

  /// convert wind direction from letters to words => N = North
  /* getWindDir(String dir) {
    switch (dir) {
      case 'N': return Strings.north.tr;
      case 'S': return Strings.south.tr;
      case 'E': return Strings.east.tr;
      case 'W': return Strings.west.tr;
      case 'NE': case 'NNE': case 'ENE': return Strings.northeast.tr;
      case 'SE': case 'ESE': case 'SSE': return Strings.southeast.tr;
      case 'SW': case 'SSW': case 'WSW': return Strings.southwest.tr;
      case 'NW': case 'WNW': case 'NNW': return Strings.northwest.tr;
      default: return dir;
    }
  }

  /// convert the DateTime to day => 2023-09-24 = Sunday
  convertDateToDay(DateTime date) {
    if (date.day == DateTime.now().day) return Strings.today.tr;
    //return DateFormat('EEEE').format(date);
    return DateFormat.EEEE(currentLanguage).format(date);
  }

  /// convert the date to time => 2023-09-24 01:00 = 01:00
  convertDateToTime(String date) {
    var dateTime = DateTime.parse(date);
    if (dateTime.hour == DateTime.now().hour) return Strings.now.tr;
    return DateFormat('HH:mm').format(dateTime);
  }

  /// format the time => 01:00 AM = 01:00
  formatTime(String time) {
    var dateTime = DateFormat("hh:mm a").parse(time);
    return DateFormat("hh:mm").format(dateTime);
  } */

  /// when the user change the selected day
  onDaySelected(String day) {
    selectedDay = day;
    /* forecastday = weatherDetails.forecast.forecastday.firstWhere((fd) {
      return convertDateToDay(fd.date) == day;
    }); */
    var index = weatherDetails.forecast.forecastday.indexWhere((fd) {
      //return convertDateToDay(fd.date) == day;
      return fd.date.convertToDay() == day;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
    );
    onCardSlided(index);
    //update();
  }

  /// when the user slide the weather card
  onCardSlided(int index) {
    forecastday = weatherDetails.forecast.forecastday[index];
    //selectedDay = convertDateToDay(forecastday.date);
    selectedDay = forecastday.date.convertToDay();
    currentPage = index;
    update();
    //update([dotIndicatorsId]);
  }

}
