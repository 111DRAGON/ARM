


import 'get_activation_notification_licence_data_model.dart';

class GetActivationNotificationLicencesModel {
  final bool success;
  final String message;
  final List<GetActivationNotificationLicencesDataModel> data;

  GetActivationNotificationLicencesModel(
      {required this.success, required this.message, required this.data});

  factory GetActivationNotificationLicencesModel.fromJson(Map<String, dynamic> json) {
    return GetActivationNotificationLicencesModel(
      success: json['success'],
      message: json['message'],
      data: List.from(
        (json['data']["content"] as List).map((e) => GetActivationNotificationLicencesDataModel.fromJson(e)),
      ),
    );
  }
}

