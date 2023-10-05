import 'package:get/get.dart';

import '../../../../config/theme/my_theme.dart';
import '../../../../config/translations/localization_service.dart';
import '../../../../utils/constants.dart';
import '../../../data/local/my_shared_pref.dart';
import '../../../data/models/weather_model.dart';
import '../../../services/api_call_status.dart';
import '../../../services/base_client.dart';
import '../../../services/location_service.dart';
import '../views/widgets/location_dialog.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // get the current language code
  var currentLanguage = LocalizationService.getCurrentLocal().languageCode;

  // hold current weather data
  late WeatherModel currentWeather;

  // hold the weather arround the world
  List<WeatherModel> weatherArroundTheWorld = [];

  // for update
  final dotIndicatorsId = 'DotIndicators';
  final themeId = 'Theme';

  // api call status
  ApiCallStatus apiCallStatus = ApiCallStatus.loading;

  // for app theme
  var isLightTheme = MySharedPref.getThemeIsLight();
  
  // for weather slider and dot indicator
  var activeIndex = 1;

  @override
  void onInit() async {
    if (!await LocationService().hasLocationPermission()) {
      Get.dialog(const LocationDialog());
    } else {
      getUserLocation();
    }
    super.onInit();
  }

  /// get the user location
  getUserLocation() async {
    var locationData = await LocationService().getUserLocation();
    if (locationData != null) {
      await getCurrentWeather('${locationData.latitude},${locationData.longitude}');
    }
  }
  
  /// get home screem data (sliders, brands, and cars)
  getCurrentWeather(String location) async {
    await BaseClient.safeApiCall(
      Constants.currentWeatherApiUrl,
      RequestType.get,
      queryParameters: {
        Constants.key: Constants.apiKey,
        Constants.q: location,
        Constants.lang: currentLanguage,
      },
      onSuccess: (response) async {
        currentWeather = WeatherModel.fromJson(response.data);
        await getWeatherArroundTheWorld();
        apiCallStatus = ApiCallStatus.success;
        update();
      },
      onError: (error) {
        BaseClient.handleApiError(error);
        apiCallStatus = ApiCallStatus.error;
        update();
      },
    );
  }

  /// get weather arround the world
  getWeatherArroundTheWorld() async {
    weatherArroundTheWorld.clear();
    final cities = ['London', 'Cairo', 'Alaska'];
    await Future.forEach(cities, (city) {
      BaseClient.safeApiCall(
        Constants.currentWeatherApiUrl,
        RequestType.get,
        queryParameters: {
          Constants.key: Constants.apiKey,
          Constants.q: city,
          Constants.lang: currentLanguage,
        },
        onSuccess: (response) {
          weatherArroundTheWorld.add(WeatherModel.fromJson(response.data));
          update();
        },
        onError: (error) => BaseClient.handleApiError(error),
      );
    });
  }

  /// when the user slide the weather card
  onCardSlided(index, reason) {
    activeIndex = index;
    update([dotIndicatorsId]);
  }

  /// when the user press on change theme icon
  onChangeThemePressed() {
    MyTheme.changeTheme();
    isLightTheme = MySharedPref.getThemeIsLight();
    update([themeId]);
  }
  
  /// when the user press on change language icon
  onChangeLanguagePressed() async {
    currentLanguage = currentLanguage == 'ar' ? 'en' : 'ar';
    await LocalizationService.updateLanguage(currentLanguage);
    apiCallStatus = ApiCallStatus.loading;
    update();
    await getUserLocation();
  }
}
