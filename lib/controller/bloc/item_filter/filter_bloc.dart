import 'package:finalapppp/controller/bloc/item_filter/filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';
import 'filter_event.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  String selectedCategoryName;
  FilterBloc({required this.selectedCategoryName}) : super(FilterInitialState()) {
    itemFilter();
  }

  itemFilter() async{
    List categoryDataFilter = await RestApiClientService.shared.getFilteredData(selectedCategoryName);
    print("categoryDataFilter"+categoryDataFilter.toString());
    emit(FilterLoadingState(categoryDataFilter));
  }


}