abstract class HomeEvent {}


class HomeNotificationTapEvent extends HomeEvent {

}

class HomeCartTapEvent extends HomeEvent {
}

class HomeSearchTapEvent extends HomeEvent {
}

class HomeOffersSeeAllTapEvent extends HomeEvent {
}

class HomeCategoryItemTapEvent extends HomeEvent {
  final String selectedCategoryIndex;
  HomeCategoryItemTapEvent(this.selectedCategoryIndex);
}

class HomeDiscountSeeAllTapEvent extends HomeEvent {
}

class HomeDiscountCardTapEvent extends HomeEvent {
  final int selecteIndex;
  HomeDiscountCardTapEvent(this.selecteIndex);
}

class HomeRecommendSeeAllTapEvent extends HomeEvent {
}
class FilterTapEvent extends HomeEvent {
}
class RecommendCardTapEvent extends HomeEvent {
}