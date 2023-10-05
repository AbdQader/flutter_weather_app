import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../config/translations/localization_service.dart';
import '../config/translations/strings_enum.dart';

extension StringExtension on String {
  /// get the existing countries only
  String toRightCountry() {
    if (this == 'Israel') return 'Palestine';
    return this;
  }

  /// get the existing cities only
  String toRightCity() {
    if (this == 'Sederot') return 'Gaza';
    return this;
  }

  /// convert icon resolution from 64x64 to 128x128
  String toHighRes() {
    return replaceFirst('64x64', '128x128');
  }

  /// add http: before the icon link
  String addHttpPrefix() {
    return 'https:$this';
  }

  /// convert wind direction from letters to words => N = North
  String getWindDir() {
    switch (this) {
      case 'N': return Strings.north.tr;
      case 'S': return Strings.south.tr;
      case 'E': return Strings.east.tr;
      case 'W': return Strings.west.tr;
      case 'NE': case 'NNE': case 'ENE': return Strings.northeast.tr;
      case 'SE': case 'ESE': case 'SSE': return Strings.southeast.tr;
      case 'SW': case 'SSW': case 'WSW': return Strings.southwest.tr;
      case 'NW': case 'WNW': case 'NNW': return Strings.northwest.tr;
      default: return this;
    }
  }

  /// convert the date to time => 2023-09-24 01:00 = 01:00
  String convertToTime() {
    var dateTime = DateTime.parse(this);
    if (dateTime.hour == DateTime.now().hour) return Strings.now.tr;
    return DateFormat('HH:mm').format(dateTime);
  }

  /// format the time => 01:00 AM = 01:00
  String formatTime() {
    var dateTime = DateFormat("hh:mm a").parse(this);
    return DateFormat("hh:mm").format(dateTime);
  }

}

extension DateTimeExtension on DateTime {
  /// convert the DateTime to day => 2023-09-24 = Sunday
  String convertToDay() {
    if (day == DateTime.now().day) return Strings.today.tr;
    return DateFormat.EEEE(LocalizationService.getCurrentLocal().languageCode)
      .format(this);
  }
}
