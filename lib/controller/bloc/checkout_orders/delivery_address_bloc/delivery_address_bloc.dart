import 'package:finalapppp/controller/bloc/checkout_orders/delivery_address_bloc/delivery_address_event.dart';
import 'package:finalapppp/controller/bloc/checkout_orders/delivery_address_bloc/delivery_address_state.dart';
import 'package:finalapppp/ui/CheckoutOrders/checkout_order_screen.dart';
import 'package:finalapppp/ui/CheckoutOrders/deliver_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../services/rest_api/client.dart';
import '../../../../widgets/CheckoutOrders/add_address_bottomsheet.dart';

class DeliveryAddressBloc extends Bloc<DeliveryAddressEvent,DeliveryAddressState>{

  DeliveryAddressBloc():super(AdressInitialState()){
    on<AddAddressTapEvent>((event, emit) => getPopUp(event.context));
    on<ApplyAddressTapEvent>((event, emit) => navigateNext(event.context,event.index));
    getData();
  }

   getData() async{
     List result = await RestApiClientService.shared.deliveryaddress;
     var s=await RestApiClientService.shared.deliveryaddress.toString();
     print(s);
     emit(AddressLoadedState( result));
     return result;
  }

  getPopUp( BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set this to true if you want the sheet to take up the whole screen
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: AddAddressForm(), // Create a new widget for the form
          ),
        );
      },
    );
  }

  navigateNext(BuildContext context, int index) {
    emit(ApplyAdressTapState(index));
  }
}