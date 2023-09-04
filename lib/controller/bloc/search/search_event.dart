abstract class SearchEvent{}
class SearchTextChangedEvent extends SearchEvent{
  String  text;
  SearchTextChangedEvent(this.text,);
}