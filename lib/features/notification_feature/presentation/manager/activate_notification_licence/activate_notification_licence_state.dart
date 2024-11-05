



import '../../../data/models/activate_notification_licence_model.dart';

sealed class ActivateNotificationLicenceState {}

final class ActivateNotificationLicenceInitialState extends ActivateNotificationLicenceState {}

final class ActivateNotificationLicenceLoadingState extends ActivateNotificationLicenceState {}

final class ActivateNotificationLicenceSuccessState extends ActivateNotificationLicenceState {
  final ActivateNotificationLicenceModel model;

  ActivateNotificationLicenceSuccessState(this.model);
}

final class ActivateNotificationLicenceFailureState extends ActivateNotificationLicenceState {
  final String errorMessage;

  ActivateNotificationLicenceFailureState(this.errorMessage);
}
