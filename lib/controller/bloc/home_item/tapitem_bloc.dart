import 'package:finalapppp/controller/bloc/home_item/tapitem_event.dart';
import 'package:finalapppp/controller/bloc/home_item/tapitem_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';

class ItemTapBloc extends Bloc<TapItemEvent, ItemTapState> {
  BuildContext? context;
  ItemTapBloc() : super(ItemTapInitialState()) {
    //on<MenuitemEvent>(_menuItem);
    HomeMenuData();
  }
  Future HomeMenuData() async {
    List result = await RestApiClientService.shared.getHomeItemData();
    // print(result.toString());
    // double price=0;
    // for(int i=0;i<result.length;i++) {
    //   print(result[i]['price'].toString());
    //   // if(selectedItem==result[i]['price'].toString()){
    //     price=result[i]['price']+price;
    //   // }
    // }
    // print(price);
    print("recommended...." + result.toString());
    emit(ItemTapLoadingtate(homeitemdata: result));
  }


  // void _menuItem(MenuitemEvent event, Emitter<ItemTapState> emit) async {
  //   if (state is ItemTapLoadingtate) {
  //     emit(ItemTapLoadingtate();
  //   }
  // }

  void likeItem(int index,ItemLikeEvent event, Emitter<ItemTapState> emit) {
    final currentState = state as ItemLikeState;
    List<bool> updatedLikedItems = List.from(currentState.likedItems);
   updatedLikedItems[event.index] = true;
    emit(ItemLikeState(updatedLikedItems,currentState.likedItems));
  }
}
