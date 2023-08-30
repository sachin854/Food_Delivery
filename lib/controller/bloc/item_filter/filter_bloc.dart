import 'package:finalapppp/controller/bloc/item_filter/filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';
import 'filter_event.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitialState()) {
    itemFilter();

  }

  itemFilter() async{
    List result = await RestApiClientService.shared.getFilterdata();
    print("item result...."+result.toString());
    emit(FilterLoadingState(result));
  }


}