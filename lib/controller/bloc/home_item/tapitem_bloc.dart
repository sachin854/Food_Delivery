import 'package:finalapppp/controller/bloc/home_item/tapitem_event.dart';
import 'package:finalapppp/controller/bloc/home_item/tapitem_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';

class ItemTapBloc extends Bloc<TapItemEvent, ItemTapState> {
  BuildContext? context;
int? selectedItem;
  ItemTapBloc(this.selectedItem) : super(ItemTapInitialState()) {
    on<MenuitemEvent>(_menuItem);
    HomeMenuData();
  }

  Future HomeMenuData() async {
    List result = await RestApiClientService.shared.getHomeItemData();
    print("recommended...." + result.toString());
    emit(ItemTapLoadingtate(homeitemdata: result));
  }


  void _menuItem(MenuitemEvent event, Emitter<ItemTapState> emit) async {
    if (state is ItemTapLoadingtate) {
      List result = await RestApiClientService.shared.getHomeItemData();
      double totalPrice = 0.0;

      for (int i = 0; i < result.length; i++) {
        print(result[i]['price'].toString()+"...selected index..."+event.item.toString()+"///"+i.toString());
        if (event.item == i) {
          final priceAsString = result[event.item]['price'].toString();
          double price = 0.0;
          try {
            price = double.parse(priceAsString);
          } catch (e) {
            print('Invalid price format: $priceAsString');
          }
          if (price != 0.0) {
            totalPrice += price;
            print('priceeee$totalPrice');
          }
          /*final priceAsString = result[event.item]['price'].toString();
          double price = double.parse(result[event.item]['price'].toString());
          totalPrice = totalPrice + price;*/
        }
      }
      emit(ItemTapLoadingtate(homeitemdata: result,index: totalPrice));
    }

  }

    void likeItem(int index, ItemLikeEvent event, Emitter<ItemTapState> emit) {
      final currentState = state as ItemLikeState;
      List<bool> updatedLikedItems = List.from(currentState.likedItems);
      updatedLikedItems[event.index] = true;
      emit(ItemLikeState(updatedLikedItems, currentState.likedItems));
    }
  }
