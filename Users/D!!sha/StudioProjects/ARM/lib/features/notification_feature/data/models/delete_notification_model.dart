class DeleteNotificationModel {
  final bool success;
  final String message;

  DeleteNotificationModel({
    required this.success,
    required this.message,
  });

  factory DeleteNotificationModel.fromJson(Map<String, dynamic> json) {
    return DeleteNotificationModel(
      success: json['success'],
      message: json['message'],
    );
  }
}
