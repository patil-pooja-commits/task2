part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const DASHBOARD = _Paths.DASHBOARD;
  static const SEARCH = _Paths.SEARCH;
  static const SPLASH = _Paths.SPLASH;
}

abstract class _Paths {
  static const DASHBOARD = '/dashboard';
  static const SPLASH = '/splash';
  static const SEARCH = '/search';
}
