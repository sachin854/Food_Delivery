import 'package:finalapppp/controller/bloc/recommended/recommend_event.dart';
import 'package:finalapppp/controller/bloc/recommended/recommend_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';

class RecommendedBloc extends Bloc<RecommendedEvent, RecommendedState> {
  RecommendedBloc() : super(RecommendedInitialState()) {
    recomendMenuData();
  }

  recomendMenuData() async{
    List result = await RestApiClientService.shared.getRecommendMenuData();
    emit(RecommendedLoadingState(result));
  }


}