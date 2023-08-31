abstract class ItemTapState{}

class ItemTapInitialState extends ItemTapState{}

class ItemTapLoadingtate extends ItemTapState{
  List<dynamic> homeitemdata;
  ItemTapLoadingtate(this.homeitemdata);
}