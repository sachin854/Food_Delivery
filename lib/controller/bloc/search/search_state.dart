abstract class SearchState{}
class SearchTextChangedState extends SearchState{
  List result;
  List filterData;
  List searchData;
  SearchTextChangedState(this.result,this.filterData,this.searchData);
}
class SearchInitialState extends SearchState{

}
class SearchLoadedState extends SearchState{
  List? recentSearchData;
  List? popularCuisineData;
  List? allCuisineData;
  SearchLoadedState({this.recentSearchData,this.popularCuisineData,this.allCuisineData});
}
class SearchRecentSearchState extends SearchState{
  List recentSearchData;
  SearchRecentSearchState(this.recentSearchData);
}
class SearchPopularCuisineState extends SearchState{
  List popularCuisineData;
  SearchPopularCuisineState(this.popularCuisineData);
}
class SearchAllCuisinesState extends SearchState{
  List allCuisineData;
  SearchAllCuisinesState(this.allCuisineData);
}

