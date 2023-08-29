abstract class RecommendedState{}

class RecommendedInitialState extends RecommendedState{}


class RecommendedLoadingState extends RecommendedState{
  List<dynamic> recommenddata;
  RecommendedLoadingState(this.recommenddata);
}