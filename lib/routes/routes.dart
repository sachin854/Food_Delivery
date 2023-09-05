import 'package:finalapppp/controller/bloc/checkout_orders/checkout_orders_bloc/checkout_bloc.dart';
import 'package:finalapppp/controller/bloc/checkout_orders/delivery_address_bloc/delivery_address_bloc.dart';
import 'package:finalapppp/controller/bloc/additem/additem_bloc.dart';
import 'package:finalapppp/controller/bloc/mycart/myCart_bloc.dart';
import 'package:finalapppp/controller/bloc/item_filter/filter_bloc.dart';
import 'package:finalapppp/controller/bloc/home/home_bloc.dart';
import 'package:finalapppp/controller/bloc/notification/notification_bloc.dart';
import 'package:finalapppp/controller/bloc/offers/offers_bloc.dart';
import 'package:finalapppp/controller/bloc/recommended/recommed_bloc.dart';
import 'package:finalapppp/controller/bloc/search/search_bloc.dart';
import 'package:finalapppp/controller/bloc/search/search_state.dart';
import 'package:finalapppp/ui/CheckoutOrders/checkout_order_screen.dart';
import 'package:finalapppp/ui/CheckoutOrders/deliver_address_screen.dart';
import 'package:finalapppp/ui/notification/notification_screen.dart';
import 'package:finalapppp/ui/recommended/recommended.dart';
import 'package:finalapppp/ui/search/filters_screen.dart';
import 'package:finalapppp/ui/search/search_screen.dart';
import 'package:finalapppp/ui/sign_up/sign_up.dart';
import 'package:finalapppp/widgets/CheckoutOrders/deliver_address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../ui/splash/splashScreen.dart';
import '../controller/bloc/authentication/signIn/signin_bloc.dart';
import '../controller/bloc/home_item/tapitem_bloc.dart';
import '../controller/bloc/get_discount/get_discount_bloc.dart';
import '../controller/bloc/home/home_bloc.dart';
import '../controller/bloc/item_filter/filter_bloc.dart';
import '../controller/bloc/more_category/category_bloc.dart';
import '../controller/bloc/mycart/myCart_bloc.dart';
import '../controller/bloc/notification/notification_bloc.dart';
import '../controller/bloc/offers/offers_bloc.dart';
import '../controller/bloc/payment/payment_bloc.dart';
import '../controller/bloc/recommended/recommed_bloc.dart';
import '../controller/bloc/signup/signup_bloc.dart';
import '../services/rest_api/client.dart';
import '../ui/authentication/phone_auth.dart';
import '../ui/authentication/verify_otp.dart';
import '../ui/home_screen/addbasket/add_item.dart';
import '../ui/home_screen/addbasket/homeitem_screen.dart';
import '../ui/get_discount/get_discount.dart';
import '../ui/home_screen/home_page.dart';
import '../ui/login_intro/login_intro.dart';

import '../ui/more_category/more_category.dart';
import '../ui/mycart/my_cart.dart';
import '../ui/notification/notification_screen.dart';
import '../ui/offers/special_offers.dart';
import '../ui/payment/payment.dart';
import '../ui/recommended/filter.dart';
import '../ui/recommended/recommended.dart';
import '../ui/sign_up/sign_up.dart';

class AppRoutes {
  SignInBloc signInBloc = SignInBloc();

  Route onGeneratedRoutes(RouteSettings setting) {
    RestApiClientService.shared.setToken();

    switch (setting.name) {
      case "/":
        return MaterialPageRoute(
            builder: (context) =>  const SplashScreen(
            ));
      case LoginIntro.routeName:
        return MaterialPageRoute(builder: (context) => const LoginIntro());
      case HomePage.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => HomeBloc(),
                child: const HomePage()));
        case MoreCategory.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => CategoryBloc(),
                child: const MoreCategory()));
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
                  child: const LoginScreen(),
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
                create: (context) => OffersBloc(),
                child: const SpecialOffers()));
      case RecommendedScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => RecommendedBloc(),
                child: const RecommendedScreen()));
      case FilterScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => FilterBloc(selectedCategoryName: setting.arguments as String,),
                child:  FilterScreen(selectedCategoryName: setting.arguments as String,)));
      case DeliverAddressScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => DeliveryAddressBloc(),
                child: const DeliverAddressScreen()));
      case
      CheckoutOrderScreen.routeName:
      // "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => CheckoutBloc(),
              child:  CheckoutOrderScreen(selectedItem: setting.arguments as int,)));
        case HomeItemScreen.routeName:
      case HomeItemScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => ItemTapBloc(selectedItem: setting.arguments as int),
                child: HomeItemScreen(index:setting.arguments as int,)));
      case AddItemScreen.routeName:
        Map<String, dynamic> arguments =
            setting.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => AddItemBloc(arguments['index']),
                child: AddItemScreen( )));
      case Payment.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => PaymentBloc(),
                child:  Payment(totalPrice: setting.arguments as double,)));
        case GetDiscount.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) => GetDiscountBloc(),
                child:  GetDiscount(totalPrice: setting.arguments as double,)));
      case SearchScreen.routeName:
        return MaterialPageRoute(
            builder: (context) =>  BlocProvider(
              create: (context)=>SearchBloc(),
              child: const SearchScreen(
              ),
            ));
      case ApplyFiltersScreen.routeName: return MaterialPageRoute(
          builder: (context) =>  const ApplyFiltersScreen(
          ));
      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
