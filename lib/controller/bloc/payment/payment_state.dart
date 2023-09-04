abstract class PaymentState{

}

class PaymentLoadingState extends PaymentState{
}
class PaymentLoadedState extends PaymentState{
  List<dynamic> paymentData;
  PaymentLoadedState(this.paymentData,);
}

class PaymentCardSelectionTappedState extends PaymentState{
  final int selectedIndex;
  PaymentCardSelectionTappedState(this.selectedIndex);
}

class PaymentAppyTappedState extends PaymentState{
}

class PaymentErrorState extends PaymentState{
  final String errorMessage;
  PaymentErrorState(this.errorMessage);
}
