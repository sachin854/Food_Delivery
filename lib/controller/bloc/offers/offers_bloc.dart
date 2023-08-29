import 'package:finalapppp/controller/bloc/offers/offers_event.dart';
import 'package:finalapppp/controller/bloc/offers/offers_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  OffersBloc() : super(OffersInitialState()) {
    offerData();
  }

  offerData() async{
    List result = await RestApiClientService.shared.getOffersData();
    emit(OffersLoadingState(result));

  }
}

