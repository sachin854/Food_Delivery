import 'package:flutter/cupertino.dart';

abstract class CheckoutEvent{}
class AddressTapEvent extends CheckoutEvent{
  BuildContext context;
  AddressTapEvent(this.context);
}
class AddItemsTapEvent extends CheckoutEvent{}
class EditItemsTapEvent extends CheckoutEvent{}
class PaymentTapEvent extends CheckoutEvent{
  BuildContext context;
  double totalOrderPrice;
  PaymentTapEvent(this.context, this.totalOrderPrice);
}
class GetDiscountsTapEvent extends CheckoutEvent{
  BuildContext context;
  double totalOrderPrice;
  GetDiscountsTapEvent(this.context,this.totalOrderPrice);
}
class PlaceOrderTapEvent extends CheckoutEvent{
  BuildContext context;
  PlaceOrderTapEvent(this.context);
}