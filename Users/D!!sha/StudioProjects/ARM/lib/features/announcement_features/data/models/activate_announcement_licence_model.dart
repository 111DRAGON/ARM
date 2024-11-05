class ActivateAnnouncementLicenceModel {
  bool success;
  String message;

  ActivateAnnouncementLicenceModel({
    required this.success,
    required this.message,
  });

  factory ActivateAnnouncementLicenceModel.fromJson(Map<String, dynamic> json) {
    return ActivateAnnouncementLicenceModel(
      success: json['success'],
      message: json['message'],
    );
  }
}
