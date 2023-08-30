abstract class MyCartEvent{}
class MyCartDeleteTapEvent extends MyCartEvent{
  final int index;
  MyCartDeleteTapEvent(this.index);
}