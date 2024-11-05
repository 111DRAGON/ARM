class DeleteBusinessLicenceModel {
  final bool success;
  final String message;

  DeleteBusinessLicenceModel({
    required this.success,
    required this.message,
  });

  factory DeleteBusinessLicenceModel.fromJson(Map<String, dynamic> json) {
    return DeleteBusinessLicenceModel(
      success: json['success'],
      message: json['message'],
    );
  }
}
