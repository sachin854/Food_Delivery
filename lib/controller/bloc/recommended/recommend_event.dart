abstract class RecommendedEvent {}

class RecomendFilterEvent extends RecommendedEvent {
  final int item;
  RecomendFilterEvent(this.item);
}
class RecomendLikeEvent extends RecommendedEvent{
int index;
RecomendLikeEvent(this.index);

}
class RecommendValidEvent extends RecommendedEvent{

}