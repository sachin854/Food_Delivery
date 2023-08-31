abstract class SearchState{}
class SearchTextChangedState extends SearchState{}
class SearchInitialState extends SearchState{}
class SearchLoadingState extends SearchState{}
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

