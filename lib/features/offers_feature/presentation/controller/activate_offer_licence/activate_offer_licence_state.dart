



import '../../../data/models/activate_offer_licence_model.dart';

sealed class ActivateOfferLicenceState {}

final class ActivateOfferLicenceInitialState extends ActivateOfferLicenceState {}

final class ActivateOfferLicenceLoadingState extends ActivateOfferLicenceState {}

final class ActivateOfferLicenceSuccessState extends ActivateOfferLicenceState {
  final ActivateOfferLicenceModel model;

  ActivateOfferLicenceSuccessState(this.model);
}

final class ActivateOfferLicenceFailureState extends ActivateOfferLicenceState {
  final String errorMessage;

  ActivateOfferLicenceFailureState(this.errorMessage);
}
