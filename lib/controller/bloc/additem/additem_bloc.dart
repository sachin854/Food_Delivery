import 'package:finalapppp/controller/bloc/additem/additem_event.dart';
import 'package:finalapppp/controller/bloc/additem/additem_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  AddItemBloc(index) : super(AddItemInitialState()) {
    addedItem(index);
  }

  Future addedItem(int id) async {
    Map<String,dynamic> result = await RestApiClientService.shared.additemdata(id.toString());
    print("recommended...." + result.toString());
    emit(AddItemLoadingState(additemdata: result));
  }

}
