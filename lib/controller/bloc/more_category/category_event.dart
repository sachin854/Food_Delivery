abstract class CategoryEvent {}


class CategoryItemTapEvent extends CategoryEvent {
  String selectedCategoryName;
  CategoryItemTapEvent(this.selectedCategoryName);
}