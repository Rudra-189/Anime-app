import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/views/detail_view/detail_screen.dart';
import 'package:project2/views/home_view/home_screen.dart';
import 'package:project2/views/splash_view/splash_screen.dart';

import '../constants/app_constants.dart';

class AppRouter{
  static Route<dynamic>generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case AppConstants.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppConstants.detailRoute:
        return MaterialPageRoute(builder: (_) => DetailScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'),),));
    }
  }
}