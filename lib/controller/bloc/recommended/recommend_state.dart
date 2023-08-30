import 'package:flutter/cupertino.dart';

abstract class RecommendedState{}

class RecommendedInitialState extends RecommendedState{}

class RecommendedLoadingState extends RecommendedState{
  List<dynamic> recommenddata;
  RecommendedLoadingState(this.recommenddata);
}
class RecommendedFilterState extends RecommendedState{

  RecommendedFilterState();
}
