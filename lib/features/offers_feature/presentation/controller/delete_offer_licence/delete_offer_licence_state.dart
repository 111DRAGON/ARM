

import '../../../data/models/delete_offer_licence_model.dart';

sealed class DeleteOfferLicenceState {}

final class DeleteOfferLicenceInitialState extends DeleteOfferLicenceState {}

final class DeleteOfferLicenceLoadingState extends DeleteOfferLicenceState {}

final class DeleteOfferLicenceSuccessState extends DeleteOfferLicenceState {
  final DeleteOfferLicenceModel model;

  DeleteOfferLicenceSuccessState(this.model);
}

final class DeleteOfferLicenceFailureState extends DeleteOfferLicenceState {
  final String errorMessage;

  DeleteOfferLicenceFailureState(this.errorMessage);
}
