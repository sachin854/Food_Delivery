abstract class CheckoutState{}
class CheckoutInitialState extends CheckoutState{}
class CheckoutLoadedState extends CheckoutState{
List addresData;
CheckoutLoadedState(this.addresData);
}
class CheckoutAddressState extends CheckoutState{
  int? index;
  CheckoutAddressState(this.index);
}
class AddressChangedState extends CheckoutState{
  List address;
  AddressChangedState(this.address,);
}
class CheckoutOrderSummaryState extends CheckoutState{}
class CheckoutAddressTapState extends CheckoutState{}


