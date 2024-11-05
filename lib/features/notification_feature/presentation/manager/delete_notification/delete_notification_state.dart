
import '../../../data/models/delete_notification_model.dart';

sealed class DeleteNotificationState {}

final class DeleteNotificationInitialState extends DeleteNotificationState {}

final class DeleteNotificationLoadingState extends DeleteNotificationState {}

final class DeleteNotificationSuccessState extends DeleteNotificationState {
  final DeleteNotificationModel model;

  DeleteNotificationSuccessState(this.model);
}

final class DeleteNotificationFailureState extends DeleteNotificationState {
  final String errorMessage;

  DeleteNotificationFailureState(this.errorMessage);
}
