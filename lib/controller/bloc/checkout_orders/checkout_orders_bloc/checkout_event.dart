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
  PaymentTapEvent(this.context);
}
class GetDiscountsTapEvent extends CheckoutEvent{
  BuildContext context;
  GetDiscountsTapEvent(this.context);
}
class PlaceOrderTapEvent extends CheckoutEvent{
  BuildContext context;
  PlaceOrderTapEvent(this.context);
}