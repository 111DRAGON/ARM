import '../../../data/models/get_activation_business_model.dart';

abstract class GetActivationBusinessState {}

class GetActivationBusinessInitialState extends GetActivationBusinessState {}

class GetActivationBusinessLoadingState extends GetActivationBusinessState {}

class GetActivationBusinessSuccessState extends GetActivationBusinessState {
  final GetActivationBusinessModel model;

  GetActivationBusinessSuccessState(this.model);
}

class GetActivationBusinessFailureState extends GetActivationBusinessState {
  final String errorMessage;

  GetActivationBusinessFailureState(this.errorMessage);
}