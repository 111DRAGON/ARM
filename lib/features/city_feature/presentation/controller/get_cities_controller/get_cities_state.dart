
import '../../../data/models/cities_model.dart';

class GetCitiesState {}

class GetCitiesInitialState extends GetCitiesState {}

class GetCitiesLoadingState extends GetCitiesState {}

class GetCitiesChangedState extends GetCitiesState {}

class GetCitiesSuccessState extends GetCitiesState {
  //final CitiesModel model;

  //GetCitiesSuccessState(this.model);
}

class GetCitiesFailureState extends GetCitiesState {
  final String errorMessage;

  GetCitiesFailureState(this.errorMessage);
}
