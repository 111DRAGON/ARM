class ActivateOfferLicenceModel {
  bool success;
  String message;

  ActivateOfferLicenceModel({
    required this.success,
    required this.message,
  });

  factory ActivateOfferLicenceModel.fromJson(Map<String, dynamic> json) {
    return ActivateOfferLicenceModel(
      success: json['success'],
      message: json['message'],
    );
  }
}
