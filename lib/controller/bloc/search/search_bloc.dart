import 'package:finalapppp/controller/bloc/search/search_event.dart';
import 'package:finalapppp/controller/bloc/search/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState()) {
    getRecentSearch();
    getPopularCuisines();
    getAllCuisines();
  }

  getRecentSearch() async {
    List result = await RestApiClientService.shared.getRecentSearchData();
    print("ssssssss");
    print(result);
    emit(SearchRecentSearchState(result));
    return result;
  }

  getPopularCuisines() async {
    List result = await RestApiClientService.shared.getPopularCuisines();
    emit(SearchPopularCuisineState(result));
    return result;
  }

  getAllCuisines() async {
    List result = await RestApiClientService.shared.getPopularCuisines();
    emit(SearchAllCuisinesState(result));
    return result;
  }
}
