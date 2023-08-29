import 'package:finalapppp/controller/bloc/notification/notification_bloc.dart';
import 'package:finalapppp/controller/bloc/offers/offers_bloc.dart';
import 'package:finalapppp/controller/bloc/recommended/recommed_bloc.dart';
import 'package:finalapppp/ui/mycart/my_cart.dart';
import 'package:finalapppp/ui/notification/notification_screen.dart';
import 'package:finalapppp/ui/recommended/recommended.dart';
import 'package:finalapppp/ui/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ui/splash/splashScreen.dart';
import '../controller/bloc/authentication/signIn/signin_bloc.dart';
import '../controller/bloc/signup/signup_bloc.dart';
import '../services/rest_api/client.dart';
import '../ui/authentication/phone_auth.dart';
import '../ui/authentication/verify_otp.dart';
import '../ui/home_screen/home_page.dart';
import '../ui/login_intro/login_intro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/offers/special_offers.dart';

class AppRoutes {
  SignInBloc signInBloc = SignInBloc();

  Route onGeneratedRoutes(RouteSettings setting) {
    RestApiClientService.shared.setToken();

    switch (setting.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case LoginIntro.routeName:
        return MaterialPageRoute(builder: (context) => const LoginIntro());
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case SignUp.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => SignUpBloc(), child: SignUp()));
      case NotificationScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => NotificationBloc(),
                child: const NotificationScreen()));
      case LoginScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: signInBloc,
                  child: LoginScreen(),
                ));
      case VerifyOtpScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: signInBloc,
                  child: VerifyOtpScreen(res: setting.arguments as Map),
                ));
      case SpecialOffers.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => OffersBloc(),
                child: SpecialOffers()));
      case RecommendedScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => RecommendedBloc(),
                child: RecommendedScreen()));
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
