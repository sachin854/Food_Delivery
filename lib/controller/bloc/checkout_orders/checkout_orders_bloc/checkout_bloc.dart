import 'package:finalapppp/controller/bloc/checkout_orders/checkout_orders_bloc/checkout_event.dart';
import 'package:finalapppp/controller/bloc/checkout_orders/checkout_orders_bloc/checkout_state.dart';
import 'package:finalapppp/services/rest_api/client.dart';
import 'package:finalapppp/ui/CheckoutOrders/deliver_address_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutBloc extends Bloc<CheckoutEvent,CheckoutState>{
  BuildContext? context;
  CheckoutBloc():super(CheckoutInitialState()){
    getAddressData();
    addressChange( );
    on<PaymentTapEvent>((event, emit) => paymentNavigate(event.context));
    on<GetDiscountsTapEvent>((event, emit) => getDiscountNavigate(event.context));
    on<AddressTapEvent>((event, emit) => addressNavigate(event.context));
    on<PlaceOrderTapEvent>((event, emit) =>placeorderNavigate(event.context));
  }

  paymentNavigate(BuildContext context) {
    Navigator.pushNamed(context, DeliverAddressScreen.routeName);
  }

  getDiscountNavigate(BuildContext context) {
    Navigator.pushNamed(context, DeliverAddressScreen.routeName);
  }

  addressNavigate(BuildContext context) {
    emit(CheckoutAddressTapState());
  }

  placeorderNavigate(BuildContext context) {
    Navigator.pushNamed(context, DeliverAddressScreen.routeName);
  }

  void getAddressData() {
    var addressData=  RestApiClientService.shared.deliveryaddress;
    emit(CheckoutLoadedState(addressData));
  }



  void addressChange() {
    var addressData=  RestApiClientService.shared.deliveryaddress;
    emit(AddressChangedState(addressData));
  }
}