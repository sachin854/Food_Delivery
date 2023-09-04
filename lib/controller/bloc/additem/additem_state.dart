abstract class AddItemState {}

class AddItemInitialState extends AddItemState{}

class AddItemLoadingState extends AddItemState{
  Map<String,dynamic> additemdata;
  int? index;
  AddItemLoadingState({required this.additemdata, this.index});
}