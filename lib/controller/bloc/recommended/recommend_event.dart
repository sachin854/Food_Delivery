abstract class RecommendedEvent {}

class RecomendFilterEvent extends RecommendedEvent {
  final int item;
  RecomendFilterEvent(this.item);
}

class RecommendValidEvent extends RecommendedEvent{

}