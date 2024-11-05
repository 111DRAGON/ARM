
import '../../../data/models/regions_model.dart';

class GetRegionsState {}

class GetRegionsInitialState extends GetRegionsState {}

class GetRegionsLoadingState extends GetRegionsState {}

class GetRegionsSelectState extends GetRegionsState {}

class GetRegionsSuccessState extends GetRegionsState {
  final RegionsModel model;

  GetRegionsSuccessState(this.model);
}

class GetRegionsFailureState extends GetRegionsState {
  final String errorMessage;

  GetRegionsFailureState(this.errorMessage);
}
