// ignore_for_file: file_names, constant_identifier_names, non_constant_identifier_names, prefer_const_constructors

import 'package:get/route_manager.dart';
import '../views/screens/home.dart';
import '../views/screens/splash.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomePage()),
    GetPage(name: _Paths.SPLASH, page: () => Splash()),
  ];
}

class Routes {
  static const HOME = _Paths.HOME;
  static String SPLASH = _Paths.SPLASH;
}

abstract class _Paths {
  static const HOME = '/home';
  static const SPLASH = '/splash';
}
