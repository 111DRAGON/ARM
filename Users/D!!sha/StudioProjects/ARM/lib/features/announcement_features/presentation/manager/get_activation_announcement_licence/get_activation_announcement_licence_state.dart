



import '../../../data/models/get_activation_announcement_licence_model.dart';

class GetActivationAnnouncementLicenceState {}

class GetActivationAnnouncementLicenceInitialState extends GetActivationAnnouncementLicenceState {}

class GetActivationAnnouncementLicenceLoadingState extends GetActivationAnnouncementLicenceState {}

class GetActivationAnnouncementLicenceSuccessState extends GetActivationAnnouncementLicenceState {
  final GetActivationAnnouncementLicencesModel model;

  GetActivationAnnouncementLicenceSuccessState(this.model);
}

class GetActivationAnnouncementLicenceFailureState extends GetActivationAnnouncementLicenceState {
  final String errorMessage;

  GetActivationAnnouncementLicenceFailureState(this.errorMessage);
}
