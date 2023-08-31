import 'package:finalapppp/controller/bloc/recommended/recommend_event.dart';
import 'package:finalapppp/controller/bloc/recommended/recommend_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/rest_api/client.dart';
import '../../../ui/recommended/filter.dart';
import 'recommend_event.dart';
import 'recommend_state.dart';

class RecommendedBloc extends Bloc<RecommendedEvent, RecommendedState> {
  RecommendedBloc() : super(RecommendedInitialState()) {
    on<RecomendFilterEvent>(filtertap);
    recomendMenuData();
  }

  Future recomendMenuData() async {
    List result = await RestApiClientService.shared.getRecommendMenuData();
    print("recommended...." + result.toString());
    emit(RecommendedLoadingState(result));
  }

  void filtertap(RecomendFilterEvent event, Emitter<RecommendedState> emit) {
    final currentState = state;
    if (currentState is RecommendedLoadingState) {
        var selectedFilter = currentState.recommenddata[event.item];
        if (selectedFilter == "Hamburger") {
          print("selecteddddd...."+selectedFilter);
          Navigator.pushNamed(event.item as BuildContext, FilterScreen.routeName);
        }
      emit(RecommendedFilterState());
    }
// void filtertap(
    //     RecomendFilterEvent event, Emitter<RecommendedState> emit) async {
    //   final currentState = state;
    //   if (currentState is RecommendedLoadingState) {
    //     if(event.item==true){
    //       Navigator.pushNamed(event.item as BuildContext, FilterScreen.routeName);
    //       emit(RecommendedFilterState());
    //     }
    //   }
    // }
  }
}
