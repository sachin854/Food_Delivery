abstract class CategoryState {

}


class CategoryLoadingState extends CategoryState{
}

class CategoryLoadedState extends CategoryState{
  List<dynamic> category;
  CategoryLoadedState(this.category);
}

class CategoryErrorState extends CategoryState{
  final String errorMessage;
  CategoryErrorState(this.errorMessage);
}

class CategoryItemTappedState extends CategoryState{
}