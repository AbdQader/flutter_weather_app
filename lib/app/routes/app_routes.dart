part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const WELCOME = _Paths.WELCOME;
  static const HOME = _Paths.HOME;
  static const WEATHER = _Paths.WEATHER;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const WELCOME = '/welcome';
  static const HOME = '/home';
  static const WEATHER = '/weather';
}
