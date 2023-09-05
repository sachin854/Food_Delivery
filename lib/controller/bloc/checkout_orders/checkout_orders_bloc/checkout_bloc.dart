import 'package:finalapppp/controller/bloc/checkout_orders/checkout_orders_bloc/checkout_event.dart';
import 'package:finalapppp/controller/bloc/checkout_orders/checkout_orders_bloc/checkout_state.dart';
import 'package:finalapppp/services/rest_api/client.dart';
import 'package:finalapppp/ui/CheckoutOrders/deliver_address_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ui/get_discount/get_discount.dart';
import '../../../../ui/payment/payment.dart';

class CheckoutBloc extends Bloc<CheckoutEvent,CheckoutState>{
  BuildContext? context;
  CheckoutBloc():super(CheckoutInitialState()){
    getAddressData();
    addressChange( );
    on<PaymentTapEvent>((event, emit) => paymentNavigate(event.context,event.totalOrderPrice));
    on<GetDiscountsTapEvent>((event, emit) => getDiscountNavigate(event.context,event.totalOrderPrice));
    on<AddressTapEvent>((event, emit) => addressNavigate(event.context));
    on<PlaceOrderTapEvent>((event, emit) =>placeorderNavigate(event.context));
  }

  paymentNavigate(BuildContext context, double totalOrderPrice) {
    Navigator.pushNamed(context, Payment.routeName,arguments: totalOrderPrice);
  }

  getDiscountNavigate(BuildContext context,double totalOrderPrice) {
    Navigator.pushNamed(context, GetDiscount.routeName,arguments: totalOrderPrice).then((value) {

    });
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