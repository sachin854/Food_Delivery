import 'package:finalapppp/controller/bloc/home/home_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/rest_api/client.dart';
import 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {

    homeData();

    on<HomeNotificationTapEvent>((event, emit) {
      emit(HomeNotificationTappedState());
    });

    on<HomeCartTapEvent>((event, emit) {
      emit(HomeCartTappedState());
    });

    on<HomeOffersSeeAllTapEvent>((event, emit) {
      emit(HomeOffersSeeAllTappedState());
    });

    on<HomeCategoryItemTapEvent>((event, emit) {
      emit(HomeCategoryItemTappedState());
    });

    on<HomeDiscountSeeAllTapEvent>((event, emit) {
      emit(HomeDicountCardSeeAllTappedState());
    });

    on<HomeDiscountCardTapEvent>((event, emit) {
      emit(HomeDicountCardIndividualTappedState());
    });

    on<HomeRecommendSeeAllTapEvent>((event, emit) {
      emit(HomeRecommendedSeeAllTappedState());
    });

    on<FilterTapEvent>((event, emit) {
      emit(FilterTappedState());
    });

    on<RecommendCardTapEvent>((event, emit) {
      emit(RecommendCardTappedState());
    });

  }



  Future homeData() async {
    emit(HomeLoadingState());
    User? user;
    user = FirebaseAuth.instance.currentUser;
    List userData =  RestApiClientService.shared.getUserDetails();
    List categoryData =  RestApiClientService.shared.getcategoryData();
    List discountArray =  RestApiClientService.shared.discountArray;
    print("arrayy"+discountArray.toString());
    // List discountArray =  RestApiClientService.shared.getDicountData();
    List recommendFilterData =  RestApiClientService.shared.getRecommendFilterData();
    List recommendMenuData =  RestApiClientService.shared.getRecommendMenuData();

    try {
      if (user != null) {
        emit(HomeSuccessState(user,userData,categoryData,discountArray,recommendFilterData,recommendMenuData));
        print("Home Login Success");
        // return Navigator.of(context).pushNamed(HomePage.routeName);
      } else {
        emit(HomeErrorState("Home Login failed."));
        print("Home Login failed.");
      }
    } catch (error) {
      emit(HomeErrorState("Catch-An error occurred: $error"));
    }
  }




}
