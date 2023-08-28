import 'package:flutter/material.dart';
import '../../../ui/splash/splashScreen.dart';
import '../services/rest_api/client.dart';
import '../ui/home_screen/home_page.dart';
import '../ui/login_intro/login_intro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {


  
  Route onGeneratedRoutes(RouteSettings setting) {
    RestApiClientService.shared.setToken();

    switch (setting.name) {
      case "/":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context)=>SignUpBloc(),
              child: SignUp(
              ),
            ));
      case LoginIntro.routeName:
        return MaterialPageRoute(builder: (context) => const LoginIntro());
        case HomePage.routeName:
        return MaterialPageRoute(builder: (context) =>  HomePage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
