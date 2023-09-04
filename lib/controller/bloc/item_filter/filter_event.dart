abstract class FilterEvent{}

class FilterCardEvent extends FilterEvent {
  final int selectedCategoryIndex;
  FilterCardEvent(this.selectedCategoryIndex);
}

