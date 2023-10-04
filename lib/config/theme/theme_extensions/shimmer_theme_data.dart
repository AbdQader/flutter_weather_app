import 'package:flutter/material.dart';

class ShimmerThemeData extends ThemeExtension<ShimmerThemeData> {
  final Color? backgroundColor;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerThemeData({
    this.backgroundColor,
    this.baseColor,
    this.highlightColor,
  });

  @override
  ThemeExtension<ShimmerThemeData> copyWith() {
    return ShimmerThemeData(
      backgroundColor: backgroundColor,
      baseColor: baseColor,
      highlightColor: highlightColor,
    );
  }

  @override
  ThemeExtension<ShimmerThemeData> lerp(covariant ThemeExtension<ShimmerThemeData>? other, double t) {
    if (other is! ShimmerThemeData) {
      return this;
    }

    return ShimmerThemeData(
      backgroundColor: Color.lerp(
        backgroundColor,
        other.backgroundColor,
        t,
      ),
      baseColor: Color.lerp(
        baseColor,
        other.baseColor,
        t,
      ),
      highlightColor: Color.lerp(
        highlightColor,
        other.highlightColor,
        t,
      ),
    );
  }

}