import '../../../data/models/get_activation_notification_licence_model.dart';

class GetActivationNotificationLicenceState {}

class GetActivationNotificationLicenceInitialState
    extends GetActivationNotificationLicenceState {}

class GetActivationNotificationLicenceLoadingState
    extends GetActivationNotificationLicenceState {}

class GetActivationNotificationLicenceSuccessState
    extends GetActivationNotificationLicenceState {
  final GetActivationNotificationLicencesModel model;

  GetActivationNotificationLicenceSuccessState(this.model);
}

class GetActivationNotificationLicenceFailureState
    extends GetActivationNotificationLicenceState {
  final String errorMessage;

  GetActivationNotificationLicenceFailureState(this.errorMessage);
}
