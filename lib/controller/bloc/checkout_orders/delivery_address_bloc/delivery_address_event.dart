import 'package:flutter/cupertino.dart';

abstract class DeliveryAddressEvent{}
class AddAddressTapEvent extends DeliveryAddressEvent{
  BuildContext context;
  AddAddressTapEvent(this.context);
}
class ApplyAddressTapEvent extends DeliveryAddressEvent{
  BuildContext context;
  int index;
  ApplyAddressTapEvent(this.context,this.index);
}
class RadioButtonTapEvent extends DeliveryAddressEvent{}