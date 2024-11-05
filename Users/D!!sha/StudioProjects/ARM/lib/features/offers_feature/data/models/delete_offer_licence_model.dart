class DeleteOfferLicenceModel {
  final bool success;
  final String message;

  DeleteOfferLicenceModel({
    required this.success,
    required this.message,
  });

  factory DeleteOfferLicenceModel.fromJson(Map<String, dynamic> json) {
    return DeleteOfferLicenceModel(
      success: json['success'],
      message: json['message'],
    );
  }
}
