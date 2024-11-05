
import '../../../data/models/delete_announcement_licence_model.dart';

sealed class DeleteAnnouncementLicenceState {}

final class DeleteAnnouncementLicenceInitialState extends DeleteAnnouncementLicenceState {}

final class DeleteAnnouncementLicenceLoadingState extends DeleteAnnouncementLicenceState {}

final class DeleteAnnouncementLicenceSuccessState extends DeleteAnnouncementLicenceState {
  final DeleteAnnouncementLicenceModel model;

  DeleteAnnouncementLicenceSuccessState(this.model);
}

final class DeleteAnnouncementLicenceFailureState extends DeleteAnnouncementLicenceState {
  final String errorMessage;

  DeleteAnnouncementLicenceFailureState(this.errorMessage);
}
