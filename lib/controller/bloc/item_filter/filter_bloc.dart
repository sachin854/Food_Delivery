import 'package:finalapppp/controller/bloc/item_filter/filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';
import 'filter_event.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  String selectedCategoryName;
  FilterBloc({required this.selectedCategoryName}) : super(FilterInitialState()) {
    itemFilter();
    on<FilterCardEvent>((event, emit) {
      emit(FilterCardTappedState());
    });
  }

 Future itemFilter() async{
    List sortOptions= await RestApiClientService.shared.sortOptions();
    // List categoryDataFilter = await RestApiClientService.shared.getFilteredData(selectedCategoryName);
    List categoryDataFilter = await RestApiClientService.shared.discountArray;

    List filteredData = await categoryDataFilter
        .where((item) => item["id"] == selectedCategoryName)
        .toList();

    print("categoryDataFilter"+filteredData.toString());
    emit(FilterLoadingState(sortOptions,filteredData));
  }


}