class DeleteAnnouncementLicenceModel {
  final bool success;
  final String message;

  DeleteAnnouncementLicenceModel({
    required this.success,
    required this.message,
  });

  factory DeleteAnnouncementLicenceModel.fromJson(Map<String, dynamic> json) {
    return DeleteAnnouncementLicenceModel(
      success: json['success'],
      message: json['message'],
    );
  }
}
