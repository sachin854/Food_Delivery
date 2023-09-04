import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/rest_api/client.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  CategoryBloc() : super(CategoryLoadingState()) {
    getCategoryData();
    on<CategoryItemTapEvent>((event, emit) {
      emit(CategoryItemTappedState());
    });
    }

    getCategoryData(){
      List categoryData =  RestApiClientService.shared.getcategoryData();
      try {
          emit(CategoryLoadedState(categoryData));
          print("Category Loaded Successfully");
        }
        catch (error) {
        emit(CategoryErrorState("Catch-An error occurred: $error"));
        print("Category Loading Error");
      }
    }
}