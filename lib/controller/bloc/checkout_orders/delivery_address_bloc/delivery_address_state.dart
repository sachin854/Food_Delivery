abstract class DeliveryAddressState{}
class AddAddressTapState extends DeliveryAddressState{}
class ApplyAdressTapState extends DeliveryAddressState{
  int? index;
  ApplyAdressTapState(this.index);
}
class AddressLoadedState extends DeliveryAddressState{
  List data;
  AddressLoadedState(this.data);
}
class AdressInitialState extends DeliveryAddressState{}