abstract class OffersState{}

class OffersInitialState extends OffersState{}


class OffersLoadingState extends OffersState{
  List<dynamic> offerdata;
  OffersLoadingState(this.offerdata);
}