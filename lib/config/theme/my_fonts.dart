import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFonts {
  // return the right font depending on app language
  // static TextStyle get getAppFontType => LocalizationService
  //   .supportedLanguagesFontsFamilies[MySharedPref.getCurrentLocal()
  //   .languageCode]!;

  static TextStyle get getAppFontType => const TextStyle(fontFamily: 'Poppins');

  // headlines text font
  static TextStyle get displayTextStyle => getAppFontType;

  // body text font
  static TextStyle get bodyTextStyle => getAppFontType;

  // button text font
  static TextStyle get buttonTextStyle => getAppFontType;

  // app bar text font
  static TextStyle get appBarTextStyle  => getAppFontType;

  // chips text font
  static TextStyle get chipTextStyle  => getAppFontType;

  // appbar font size
  static double get appBarTittleSize => 14.sp;

  // body font size
  static double get bodyLargeSize => 16.sp;
  static double get bodyMediumSize => 14.sp;
  static double get bodySmallTextSize => 12.sp;
  // display font size
  static double get displayLargeSize => 20.sp;
  static double get displayMediumSize => 18.sp;
  static double get displaySmallSize => 14.sp;

  //button font size
  static double get buttonTextSize => 16.sp;

  //chip font size
  static double get chipTextSize => 10.sp;

  // list tile fonts sizes
  static double get listTileTitleSize => 13.sp;
  static double get listTileSubtitleSize => 12.sp;
}