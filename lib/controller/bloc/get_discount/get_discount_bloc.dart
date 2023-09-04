import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';
import 'get_discount_event.dart';
import 'get_discount_state.dart';

class GetDiscountBloc extends Bloc<GetDiscountEvent, GetDiscountState> {
  GetDiscountBloc() : super(GetDiscountLoadingState()) {
    discountData();

    on<GetDiscountCardTapEvent>((event, emit) {
      emit(GetDiscountCardSelectionTappedState(event.selectedIndex));
    });
  }



  Future discountData() async {
    try {
      List discountData = RestApiClientService.shared.discount;
      emit(GetDiscountLoadedState(discountData));
      print("PaymentLoadedState Successfully");
    } catch (error) {
      emit(GetDiscountErrorState("Catch-An error occurred: $error"));
      print("PaymentErrorState error occurred");
    }
  }
}