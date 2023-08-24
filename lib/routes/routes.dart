import 'package:flutter/material.dart';
import '../../../ui/splash/splashScreen.dart';
import '../services/rest_api/client.dart';
import '../ui/login_intro/login_intro.dart';

class AppRoutes {

  Route onGeneratedRoutes(RouteSettings setting) {
    RestApiClientService.shared.setToken();

    switch (setting.name) {
      case "/":
        return MaterialPageRoute(builder: (context) =>   const SplashScreen());
      case LoginIntro.routeName:
        return MaterialPageRoute(builder: (context) => const LoginIntro());
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
