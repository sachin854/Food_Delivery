abstract class GetDiscountEvent{

}

class GetDiscountCardTapEvent extends GetDiscountEvent{
  int selectedIndex;
  GetDiscountCardTapEvent(this.selectedIndex);
}

class GetDiscountAddButtonTapEvent extends GetDiscountEvent{

}
class GetDiscountApplyTapEvent extends GetDiscountEvent{

}
