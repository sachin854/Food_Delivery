abstract class ItemTapState{}

class ItemTapInitialState extends ItemTapState{}

class ItemTapLoadingtate extends ItemTapState{
  List<dynamic> homeitemdata;
  int? index;

  ItemTapLoadingtate({required this.homeitemdata, this.index});
}

class ItemLikeState extends ItemTapState{
  final List<bool> likedItems;
  ItemLikeState(this.likedItems, List<dynamic> homeitemdata);
}
