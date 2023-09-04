abstract class GetDiscountState{

}

class GetDiscountLoadingState extends GetDiscountState{
}
class GetDiscountLoadedState extends GetDiscountState{
  List<dynamic> discountData;
  GetDiscountLoadedState(this.discountData,);
}

class GetDiscountCardSelectionTappedState extends GetDiscountState{
  final int selectedIndex;
  GetDiscountCardSelectionTappedState(this.selectedIndex);
}
class GetDiscountAddCardTappedState extends GetDiscountState{
}
class GetDiscountAppyTappedState extends GetDiscountState{
}

class GetDiscountErrorState extends GetDiscountState{
  final String errorMessage;
  GetDiscountErrorState(this.errorMessage);
}
