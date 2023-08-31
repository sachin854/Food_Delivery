import 'package:finalapppp/controller/bloc/home_item/tapitem_event.dart';
import 'package:finalapppp/controller/bloc/home_item/tapitem_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';

class ItemTapBloc extends Bloc<TapItemEvent, ItemTapState> {
  ItemTapBloc() : super(ItemTapInitialState()) {
    HomeMenuData();

  }
  Future HomeMenuData() async {
    List result = await RestApiClientService.shared.getHomeItemData();
    print("recommended...." + result.toString());
    emit(ItemTapLoadingtate(result));
  }
}