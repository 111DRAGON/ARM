import '../../../data/models/get_my_business_model.dart';

abstract class GetMyBusinessState {}

class GetMyBusinessInitialState extends GetMyBusinessState {}

class GetMyBusinessLoadingState extends GetMyBusinessState {}

class GetMyBusinessSuccessState extends GetMyBusinessState {
  final GetMyBusinessModel model;

  GetMyBusinessSuccessState(this.model);
}

class GetMyBusinessFailureState extends GetMyBusinessState {
  final String errorMessage;

  GetMyBusinessFailureState(this.errorMessage);
}