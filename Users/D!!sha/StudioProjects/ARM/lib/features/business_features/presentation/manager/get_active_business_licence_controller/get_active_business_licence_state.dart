import '../../../data/models/get_activation_business_licence_model.dart';

abstract class GetActivationBusinessLicenceState {}

class GetActivationBusinessLicenceInitialState extends GetActivationBusinessLicenceState {}

class GetActivationBusinessLicenceLoadingState extends GetActivationBusinessLicenceState {}

class GetActivationBusinessLicenceSuccessState extends GetActivationBusinessLicenceState {
  final GetActivationBusinessLicenceModel model;

  GetActivationBusinessLicenceSuccessState(this.model);
}

class GetActivationBusinessLicenceFailureState extends GetActivationBusinessLicenceState {
  final String errorMessage;

  GetActivationBusinessLicenceFailureState(this.errorMessage);
}