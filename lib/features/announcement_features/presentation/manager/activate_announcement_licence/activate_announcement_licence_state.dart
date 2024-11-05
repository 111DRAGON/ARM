


import '../../../data/models/activate_announcement_licence_model.dart';

sealed class ActivateAnnouncementLicenceState {}

final class ActivateAnnouncementLicenceInitialState extends ActivateAnnouncementLicenceState {}

final class ActivateAnnouncementLicenceLoadingState extends ActivateAnnouncementLicenceState {}

final class ActivateAnnouncementLicenceSuccessState extends ActivateAnnouncementLicenceState {
  final ActivateAnnouncementLicenceModel model;

  ActivateAnnouncementLicenceSuccessState(this.model);
}

final class ActivateAnnouncementLicenceFailureState extends ActivateAnnouncementLicenceState {
  final String errorMessage;

  ActivateAnnouncementLicenceFailureState(this.errorMessage);
}
