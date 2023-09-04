abstract class ItemTapState{}

class ItemTapInitialState extends ItemTapState{}

class ItemTapLoadingtate extends ItemTapState{
  List<dynamic> homeitemdata;
  double? index;

  ItemTapLoadingtate({required this.homeitemdata, this.index,});
}

class ItemLikeState extends ItemTapState{
  final List<bool> likedItems;
  ItemLikeState(this.likedItems, List<dynamic> homeitemdata);
}

class ItemCardTappedState extends ItemTapState{
  int? selectedIndex;
  ItemCardTappedState({this.selectedIndex});
}