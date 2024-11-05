

import 'get_activation_offer_licence_data_model.dart';

class GetActivationOfferLicencesModel {
  final bool success;
  final String message;
  final List<GetActivationOfferLicencesDataModel> data;

  GetActivationOfferLicencesModel(
      {required this.success, required this.message, required this.data});

  factory GetActivationOfferLicencesModel.fromJson(Map<String, dynamic> json) {
    return GetActivationOfferLicencesModel(
      success: json['success'],
      message: json['message'],
      data: List.from(
        (json['data']["content"] as List).map((e) => GetActivationOfferLicencesDataModel.fromJson(e)),
      ),
    );
  }
}

