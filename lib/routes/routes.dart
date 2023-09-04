import 'package:finalapppp/controller/bloc/checkout_orders/checkout_orders_bloc/checkout_bloc.dart';
import 'package:finalapppp/controller/bloc/checkout_orders/delivery_address_bloc/delivery_address_bloc.dart';
import 'package:finalapppp/controller/bloc/mycart/myCart_bloc.dart';
import 'package:finalapppp/controller/bloc/item_filter/filter_bloc.dart';
import 'package:finalapppp/controller/bloc/home/home_bloc.dart';
import 'package:finalapppp/controller/bloc/notification/notification_bloc.dart';
import 'package:finalapppp/controller/bloc/offers/offers_bloc.dart';
import 'package:finalapppp/controller/bloc/recommended/recommed_bloc.dart';
import 'package:finalapppp/ui/CheckoutOrders/checkout_order_screen.dart';
import 'package:finalapppp/ui/CheckoutOrders/deliver_address_screen.dart';
import 'package:finalapppp/ui/notification/notification_screen.dart';
import 'package:finalapppp/ui/recommended/recommended.dart';
import 'package:finalapppp/ui/sign_up/sign_up.dart';
import 'package:finalapppp/widgets/CheckoutOrders/deliver_address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ui/splash/splashScreen.dart';
import '../controller/bloc/authentication/signIn/signin_bloc.dart';
import '../controller/bloc/home_item/tapitem_bloc.dart';
import '../controller/bloc/signup/signup_bloc.dart';
import '../services/rest_api/client.dart';
import '../ui/authentication/phone_auth.dart';
import '../ui/authentication/verify_otp.dart';
import '../ui/home_screen/addbasket/addbasket_screen.dart';
import '../ui/home_screen/home_page.dart';
import '../ui/login_intro/login_intro.dart';

import '../ui/more_category/more_category.dart';
import '../ui/mycart/my_cart.dart';
import '../ui/offers/special_offers.dart';
import '../ui/recommended/filter.dart';

class AppRoutes {
  SignInBloc signInBloc = SignInBloc();

  Route onGeneratedRoutes(RouteSettings setting) {
    RestApiClientService.shared.setToken();

    switch (setting.name) {
      case "/":
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(
            ));
      case LoginIntro.routeName:
        return MaterialPageRoute(builder: (context) => const LoginIntro());

      case HomePage.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => HomeBloc(),
                child: HomePage()));
        case MoreCategory.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => HomeBloc(),
                child: MoreCategory()));

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
      case MyCartScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => MyCartCardBloc(),
                child: const MyCartScreen()));
      case SpecialOffers.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => OffersBloc(), child: SpecialOffers()));
      case RecommendedScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => RecommendedBloc(),
                child: RecommendedScreen()));
      case FilterScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => FilterBloc(), child: FilterScreen()));
      case DeliverAddressScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => DeliveryAddressBloc(),
                child: DeliverAddressScreen()));
      case CheckoutOrderScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => CheckoutBloc(),
              child:  CheckoutOrderScreen()));
        case HomeItemScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => ItemTapBloc(),
                child: HomeItemScreen()));
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
