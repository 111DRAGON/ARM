

import '../../../data/models/delete_business_licence_model.dart';

sealed class DeleteBusinessLicenceState {}

final class DeleteBusinessLicenceInitialState extends DeleteBusinessLicenceState {}

final class DeleteBusinessLicenceLoadingState extends DeleteBusinessLicenceState {}

final class DeleteBusinessLicenceSuccessState extends DeleteBusinessLicenceState {
  final DeleteBusinessLicenceModel model;

  DeleteBusinessLicenceSuccessState(this.model);
}

final class DeleteBusinessLicenceFailureState extends DeleteBusinessLicenceState {
  final String errorMessage;

  DeleteBusinessLicenceFailureState(this.errorMessage);
}
