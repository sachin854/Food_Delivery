import 'package:finalapppp/controller/bloc/payment/payment_event.dart';
import 'package:finalapppp/controller/bloc/payment/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentLoadingState()) {
    paymentData();

    on<PaymentCardTapEvent>((event, emit) {
      emit(PaymentCardSelectionTappedState(event.selectedIndex));
      paymentData();
    });


  }



  Future paymentData() async {
    try {
      List pay = RestApiClientService.shared.payment;
      emit(PaymentLoadedState(pay));
      print("PaymentLoadedState Successfully");
    } catch (error) {
      emit(PaymentErrorState("Catch-An error occurred: $error"));
      print("PaymentErrorState error occurred");
    }
  }
}