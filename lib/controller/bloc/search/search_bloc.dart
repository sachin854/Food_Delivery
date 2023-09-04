import 'package:finalapppp/controller/bloc/search/search_event.dart';
import 'package:finalapppp/controller/bloc/search/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState()) {
    getData();
    on<SearchTextChangedEvent>((event, emit) => getFoodData());
   // getFoodData();
    // getPopularCuisines();
    // getAllCuisines();
  }

  Future getData() async {
    List result =  RestApiClientService.shared.getRecentSearchData();
    List popular =  RestApiClientService.shared.getPopularCuisines();
    List allCuisine =  RestApiClientService.shared.getAllCuisines();
    print(result);
    emit(SearchLoadedState(recentSearchData: result, popularCuisineData: popular,allCuisineData:  allCuisine));

    // emit(SearchRecentSearchState(result));
    // emit(SearchPopularCuisineState(popular));
    // emit(SearchAllCuisinesState(allCuisine));

  }

  getPopularCuisines() async {
    List result = await RestApiClientService.shared.getPopularCuisines();
    emit(SearchPopularCuisineState(result));
    print("SearchPopularCuisineState");
  }

  getAllCuisines() async {
    List result = await RestApiClientService.shared.getAllCuisines();
    emit(SearchAllCuisinesState(result));
  }

   getFoodData() async{
    List foodData=await RestApiClientService.shared.getCartData();
    List filtersData=await RestApiClientService.shared.getFilterdata();
    List searchData=await RestApiClientService.shared.searchData;
    print("sssssssssss");
    print(state);
    print(foodData);
    emit(SearchTextChangedState(foodData,filtersData,searchData));
   }
}
