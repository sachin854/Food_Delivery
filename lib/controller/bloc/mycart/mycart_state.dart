abstract class MyCartState {}

class MyCartInitialState extends MyCartState {}

class MyCartLoadedState extends MyCartState {
  final List cartData;
   int? index;
  MyCartLoadedState({required this.cartData, this.index});
}
