import 'package:flutter/material.dart';

class CustomSnackBar {

  static showCustomSnackBar({
    required BuildContext context,
    required String message,
    Duration? duration,
    Color? color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message, style: Theme.of(context).textTheme.displayMedium,
        ),
        duration: duration ?? const Duration(seconds: 3),
        backgroundColor: color ?? Colors.green,
      ),
    );
  }

  static showCustomErrorSnackBar({
    required BuildContext context,
    required String message,
    Duration? duration,
    Color? color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message, style: Theme.of(context).textTheme.displayMedium,
        ),
        duration: duration ?? const Duration(seconds: 3),
        backgroundColor: color ?? Colors.redAccent,
      ),
    );
  }
  
}
