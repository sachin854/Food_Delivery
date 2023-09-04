abstract class PaymentEvent{

}

class PaymentCardTapEvent extends PaymentEvent{
  int selectedIndex;
  PaymentCardTapEvent(this.selectedIndex);
}

class PaymentAddButtonTapEvent extends PaymentEvent{

}
class PaymentApplyTapEvent extends PaymentEvent{

}
