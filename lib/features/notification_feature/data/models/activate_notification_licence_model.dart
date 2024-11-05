class ActivateNotificationLicenceModel {
  bool success;
  String message;

  ActivateNotificationLicenceModel({
    required this.success,
    required this.message,
  });

  factory ActivateNotificationLicenceModel.fromJson(Map<String, dynamic> json) {
    return ActivateNotificationLicenceModel(
      success: json['success'],
      message: json['message'],
    );
  }
}
