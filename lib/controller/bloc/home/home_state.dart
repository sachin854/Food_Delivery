import 'package:firebase_auth/firebase_auth.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {

}

class HomeLoadingState extends HomeState{
}

class HomeSuccessState extends HomeState {
  final User? user;
  List<dynamic> userData;
  List<dynamic> discountArray;
  List<dynamic> recommendFilterData;
  List<dynamic> recommendMenuData;
  List<dynamic> category;
  HomeSuccessState(this.user,this.userData,this.category,this.discountArray,this.recommendFilterData,this.recommendMenuData);
}

class HomeNotificationTappedState extends HomeState {
}

class HomeCartTappedState extends HomeState {
}

class HomeOffersSeeAllTappedState extends HomeState {
}

class HomeCategoryItemTappedState extends HomeState {
}

class HomeDicountCardSeeAllTappedState extends HomeState {
}

class HomeDicountCardIndividualTappedState extends HomeState {
}

class HomeRecommendedSeeAllTappedState extends HomeState {

}
class FilterTappedState extends HomeState {

}

class RecommendCardTappedState extends HomeState {

}

class HomeErrorState extends HomeState {
  final String errorMessage;
  HomeErrorState(this.errorMessage);
}
