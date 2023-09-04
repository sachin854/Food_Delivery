abstract class FilterState {}

class FilterInitialState extends FilterState {}

class FilterLoadingState extends FilterState {
  List<dynamic> categoryDataFilter;
  List<dynamic> sortOptions;
  FilterLoadingState(this.sortOptions,this.categoryDataFilter,);
}


class FilterCardTappedState extends FilterState {
}