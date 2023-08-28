import 'package:finalapppp/controller/bloc/notification/notification_bloc.dart';
import 'package:finalapppp/ui/notification/notification_screen.dart';
import 'package:finalapppp/ui/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import '../../../ui/splash/splashScreen.dart';
import '../controller/bloc/signup/signup_bloc.dart';
import '../services/rest_api/client.dart';
import '../ui/home_screen/home_page.dart';
import '../ui/login_intro/login_intro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  Route onGeneratedRoutes(RouteSettings setting) {
    RestApiClientService.shared.setToken();

    switch (setting.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case LoginIntro.routeName:
        return MaterialPageRoute(builder: (context) => const LoginIntro());
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case SignUp.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => SignUpBloc(), child: const SignUp()));
      case NotificationScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => NotificationBloc(), child: const NotificationScreen()));
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
