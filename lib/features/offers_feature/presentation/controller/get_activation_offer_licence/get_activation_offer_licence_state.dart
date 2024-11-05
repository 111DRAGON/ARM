




import '../../../data/models/get_activation_offer_licence_model.dart';

class GetActivationOfferLicenceState {}

class GetActivationOfferLicenceInitialState extends GetActivationOfferLicenceState {}

class GetActivationOfferLicenceLoadingState extends GetActivationOfferLicenceState {}

class GetActivationOfferLicenceSuccessState extends GetActivationOfferLicenceState {
  final GetActivationOfferLicencesModel model;

  GetActivationOfferLicenceSuccessState(this.model);
}

class GetActivationOfferLicenceFailureState extends GetActivationOfferLicenceState {
  final String errorMessage;

  GetActivationOfferLicenceFailureState(this.errorMessage);
}
