
import 'package:finalapppp/controller/bloc/mycart/myCart_event.dart';
import 'package:finalapppp/controller/bloc/mycart/mycart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';

class MyCartCardBloc extends Bloc<MyCartEvent,MyCartState>{
MyCartCardBloc():super(MyCartInitialState()){
  on<MyCartDeleteTapEvent>(cardDelete);
  getCartData();
}

   Future getCartData() async{
    List result = await RestApiClientService.shared.getCartData();
    emit(MyCartLoadedState(cartData: result));
    return result;

  }

void cardDelete(MyCartDeleteTapEvent event, Emitter<MyCartState> emit,) {
   final currentState=state;
   if(currentState is MyCartLoadedState){
     final currentList=currentState.cartData;
     final updatedList=currentList.removeAt(event.index);
     print("ggggggggg${event.index}");
     print(updatedList);
     emit(MyCartLoadedState(cartData: currentList));

    // return updatedList;
   }
  }


}