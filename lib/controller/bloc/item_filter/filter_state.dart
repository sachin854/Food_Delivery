abstract class FilterState {}

class FilterInitialState extends FilterState {}

class FilterLoadingState extends FilterState {
  List<dynamic> filteredData;
  List<dynamic> sortOptions;
  FilterLoadingState(this.sortOptions,this.filteredData,);
}


class FilterCardTappedState extends FilterState {
}