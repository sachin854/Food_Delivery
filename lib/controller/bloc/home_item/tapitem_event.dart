abstract class TapItemEvent{}

class ItemLikeEvent extends TapItemEvent{
  int index;
  ItemLikeEvent(this.index);
}
class MenuitemEvent extends TapItemEvent{
  int item;
  MenuitemEvent(this.item);
}